#! /usr/bin/python2

import time
import sys
import string
import serial
import smbus2

import RPi.GPIO as GPIO
from hx711 import HX711
from gpiozero import Button
from gpiozero import MotionSensor
from picamera import PiCamera

hx = HX711(5, 6)

button = Button(17) #GPIO pin of Door Switch
pir = MotionSensor(22) #GPIO pin of PIR sensor
camera = PiCamera()
camera.rotation = 180 #setups up camera
referenceUnit = 22.03478058

#Setup for Load Cells
hx.set_reading_format("MSB", "MSB")
hx.set_reference_unit(referenceUnit)

packageRef = 5
numCount = 6 
TotalWeight = 0
Door_open = False #means switch is defaulted to pressed which is closed
Door_locked = False #means door is unlocked in the beginning
UnlockPosition = 3 #Position of Servo when door is unlocked
LockPosition = 5.25#6.5 #Position of Servo when door is locked

#Adjustable G limits for gyroscope
GxLimit = 1
GyLimit = 1
GzLimit = 1

#values for keypad
k1 = 0
k2 = 0
k3 = 0
k4 = 0
kt = k1+k2+k3+k4

#Values for Gyroscope
PWR_MGT_1 = 0x6B
CONFIG=0x1A
SAMPLE_RATE = 0x19
GYRO_CONFIG = 0x1B
ACCEL_CONFIG = 0x1C
ACCEL_X_HIGH = 0x3B 
ACCEL_Y_HIGH = 0x3D
ACCEL_Z_HIGH = 0x3F
GYRO_X_HIGH = 0x43
GYRO_Y_HIGH = 0x45
GYRO_Z_HIGH = 0x47
TEMP_OUT_HIGH = 0x41

#GPIO Mode (BOARD / BCM) (Set in HX711 class)
#GPIO.setmode(GPIO.BCM)
 
#set GPIO Pins
GPIO_LOCK = 27
GPIO_LIGHT1 = 23
GPIO_LIGHT2 = 24
R1 = 11
R2 = 8
R3 = 7
R4 = 1
C1 = 0
 
#set GPIO direction (IN / OUT)
GPIO.setup(GPIO_LOCK, GPIO.OUT)
GPIO.setup(GPIO_LIGHT1, GPIO.OUT)
GPIO.setup(GPIO_LIGHT2, GPIO.OUT)
GPIO.setup(R1, GPIO.IN, pull_up_down=GPIO.PUD_DOWN)
GPIO.setup(R2, GPIO.IN, pull_up_down=GPIO.PUD_DOWN)
GPIO.setup(R3, GPIO.IN, pull_up_down=GPIO.PUD_DOWN)
GPIO.setup(R4, GPIO.IN, pull_up_down=GPIO.PUD_DOWN)
GPIO.setup(C1, GPIO.OUT)

#intializes servo pin as PWM
pwm = GPIO.PWM(GPIO_LOCK,50)
pwm.start(0)
#pwm.ChangeDutyCycle(12)

#initializes Gyro functionality
bus = smbus2.SMBus(1)
Device_Address = 0x68


#sets GPS to serial port
ser = serial.Serial("/dev/serial0",baudrate = 9600,timeout=0.5)

def DoorLock():
    global Door_locked
    pwm.ChangeDutyCycle(LockPosition)
    time.sleep(1)
    Door_locked = True
    print("Door Locked")

def DoorUnlock():
    global Door_locked 
    Door_locked= False
    pwm.ChangeDutyCycle(UnlockPosition)
    time.sleep(1)
    pwm.stop()
    print("Door Unlocked")
    
def readLine(line, chars):
    global k1
    global k2
    global k3
    global k4
    global kt
    GPIO.output(line, GPIO.HIGH)
    if(GPIO.input(R1)==1):
        k1=k1+3
        kt = k1+k2+k3+k4
        time.sleep(0.2)
        #print(chars[0])
    if(GPIO.input(R2)==1):
        k2 =k2+2
        kt = k1+k2+k3+k4
        time.sleep(0.2)
        #print(chars[1])
    if(GPIO.input(R3)==1):
        k3=k3+1
        kt = k1+k2+k3+k4
        time.sleep(0.2)
        #print(chars[2])
    if(GPIO.input(R4)==1):
        k4=k4+4
        kt = k1+k2+k3+k4
        time.sleep(0.2)
        #print(chars[3])
    
    if(kt>=7):
        DoorUnlock()
        print("Code Accepted")
    
    GPIO.output(line, GPIO.LOW)

def pic():
    camera.start_preview()
    time.sleep(2)
    camera.capture('/home/pi/Desktop/image.jpg')
    camera.stop_preview()
    
def MPU_initialization():
    bus.write_byte_data(Device_Address, PWR_MGT_1, 1)
    bus.write_byte_data(Device_Address, SAMPLE_RATE, 7)
    bus.write_byte_data(Device_Address, CONFIG, 0)
    bus.write_byte_data(Device_Address, GYRO_CONFIG, 24)
    
def Read_data(reg_add):
    high = bus.read_byte_data(Device_Address, reg_add)
    low = bus.read_byte_data(Device_Address,reg_add+1)
    value = (high<<8)|low
    
    if value>35768:
        value = value-65536
        
    return value 

def Gyro():
    ACCEL_X = Read_data(ACCEL_X_HIGH)
    ACCEL_Y = Read_data(ACCEL_Y_HIGH)
    ACCEL_Z = Read_data(ACCEL_Z_HIGH)
    GYRO_X = Read_data(GYRO_X_HIGH)
    GYRO_Y = Read_data(GYRO_Y_HIGH)
    GYRO_Z = Read_data(GYRO_Z_HIGH)
    TEMP = Read_data(TEMP_OUT_HIGH)
     
    Ax = ACCEL_X/16384.0
    Ay = ACCEL_Y/16384.0
    Az = ACCEL_Z/16384.0
     
    Gx = GYRO_X/131.0
    Gy = GYRO_Y/131.0
    Gz = GYRO_Z/131.0
     
    T = (TEMP/340)+36.53
    
    time.sleep(1)
    
    return Gx,Gy,Gz;

def NMEAConverter(data,direction):
    LatTemp = str(data)
    NMEACoord = LatTemp[2:12]
    DirTemp = str(direction)
    CoordDirection = DirTemp[2:3]
    NMEAMin = NMEACoord[-8:]
    if(len(NMEACoord) == 10):
        NMEADeg = NMEACoord[0:2]
    else:
        NMEADeg = NMEACoord[0:3]
    DecDeg = int(NMEADeg)
    DecMin = float(NMEAMin)
    DecMin = DecMin/60
    DecCoord = round(DecDeg + DecMin,5)
    Coordinates = str(DecCoord) + " " + CoordDirection
    if(CoordDirection == "S" or CoordDirection == "W"):
        GoogleCoord = DecCoord * -1
    else:
        GoogleCoord = DecCoord
    return Coordinates, GoogleCoord

def GPS():
    while True:
        received_data = ser.readline()
        parts = received_data.split(b',')

        if b'$GPGLL' in parts[0]:
            #new_data = received_data
            #print(new_data)
            if b'V' in parts[6]:
                print("There is no stable GPS connection")
            
            else:
                Latitude,GoogleLat = NMEAConverter(parts[1],parts[2])
                #print(Latitude)
                
                Longitude,GoogleLong = NMEAConverter(parts[3],parts[4])
                #print(Longitude)
                
                Coordinates = Latitude + " " + Longitude
                GoogleCoordinates = str(GoogleLat) + ", " + str(GoogleLong)
                
                print("The Current Location of your KeepSafe is: " + Coordinates)
                print("The Google Maps Coordinates are: " + GoogleCoordinates)

def KeepSafe(): 
    hx.reset()

    hx.tare()

    print("Tare done! Add weight now...")
    MPU_initialization() #initializes gyro
    pir.wait_for_motion()
    pic()
    time.sleep(1)
    Gx,Gy,Gz = Gyro()

    #After KeepSafe detects motion, it checks for movement of the box it
    #if any is detected, KeepSafe goes into safety mode
    if((abs(Gx)>=GxLimit or abs(Gy)>=GyLimit or abs(Gz)>=GzLimit)):
            DoorLock()
            GPS()
            print("Program end");
    else:
        button.wait_for_release()
        GPIO.output(GPIO_LIGHT1,True)
        GPIO.output(GPIO_LIGHT2,True)

        time.sleep(5)
        for x in range(numCount):
                
                # Prints the weight.
                val = hx.get_weight(5)
                #print(val) #debug line
                TotalWeight += val

                hx.power_down()
                hx.power_up()
                time.sleep(0.1)
            
        button.wait_for_press()

        GPIO.output(GPIO_LIGHT1, False)
        GPIO.output(GPIO_LIGHT2, False)

        AvgWeight = TotalWeight/numCount

        if(AvgWeight >= packageRef):
            DoorLock()
            print("the weight of the package is ", AvgWeight, 'g')
        
        while(Door_locked):
            kt = k1+k2+k3+k4
            #print(kt) #debug line
            readLine(C1, ["3", "4", "1", "2"])
            time.sleep(0.1)
            
        T_end = time.time() + 10 

        while time.time() < T_end:
            if(button.is_pressed):
                GPIO.output(GPIO_LIGHT1,False)
                GPIO.output(GPIO_LIGHT2,False)
            else:
                GPIO.output(GPIO_LIGHT1, True)
                GPIO.output(GPIO_LIGHT2, True)
            time.sleep(5)
            KeepSafe()

KeepSafe()
          
        
