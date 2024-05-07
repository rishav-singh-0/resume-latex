# Industrial Surveillance Robot

## Approved By SSIP Gujarat and entire project was granted by the government.

- December 2021 - March 2022

## Team:

- Rishav Singh
- Kashyap Joshi 

## Technology:

### Programming Languages:

- Verilog
- System verilog
- Embedded C

### Tools:

- Quartus
- ModelSim
- Arduino IDE

## Hardware:

- DE0-Neno
- Arduino
- QTR line sensor array
- Drivers
- DHT11
- Moisture
- Bluetooth Module
- Esp32
- Motors
- L298 motor driver

## FPGA Implementation:

### Board Selection:

[GitHub Repository](https://rishav-singh-0.github.io/industrial-surveillance-robot/)

### Implementation of SPI protocol for ADC interfacing:

- ADC:
    - NS ADC128S022
    - 8 channels
    - 12-bit A/D Converter
    - 50 ksps to 200 ksps

![ADC_SPI](./img/adc_spi.png)

### Implementation of UART protocol:

- For serial communication: for transferring sensor data to the IoT gateway and
  then it will be uploaded to the cloud. 
- Firebase service (Realtime database and Firestore)

## Design of line follower:

### Used QTR 8 array line follower:
- gives analog muxed output, so convert 1 data(12 bits) at a time and wait for
  8 such data. Then compare if middle 2 blocks have highest values. if right
  blocks have higher values means line is on right side, so increase speed of
  left motor to make the bot centered.

### Sensor calibration:

- For some seconds bot will move few rounds to sense the environment and
  measure minimum and maximum readings from the sensor array and that's how
  it's calibrated. Its necessary for working on unknown environment or
  environment with different contrast.
- 6 sensors was taken in an account.

() () () () () ()

- Middle 2 sensor should always looking at black/white line( depending upon
  color selected).
- If its not happening then bot needs to take stiff or firm turn in order to
  follow the line. 
- This will be efficient if bot will take fast actions after getting the data
  from the sensor.


### Sensor Interfacing:

#### Dht11:

- digital Sensor
- Its sensor which will give data of relative humidity and temperature.
- Uses thermistor for measurement of tempreture.
- Comescwith 4.7 or 10k resistor for providing pull up.
- We can grab data on every 2 second.
- 20-80% Relative Humidity measurement.
- 0-80°C tempreture 

[How capacitive Humidity sensor works](https://in.element14.com/sensor-humidity-sensor-technology)

[How thermistor works](https://www.pyrosales.com.au/blog/thermocouple-information/what-is-a-thermistor/)

- NTC( negetive tempreture coefficient works for small temperature ranges
  Changes its residents by changing tempreture and from the formula and the
  tempreture co-officient we can measure temperature.

#### Moisture sensor:

- The working of the soil moisture sensor is pretty straightforward.
- The fork-shaped probe with two exposed conductors, acts as a variable
  resistor (just like a potentiometer) whose resistance varies according to the
  water content in the soil.

[link to Moisture Sensor](https://lastminuteengineers.com/soil-moisture-sensor-arduino-tutorial/)

- A multiplexer can ve used with proper frequency from r sensing the moisture
  as well as the line following sensor. (By considering the delay it will
  require to switch the internal mux and converting analog data in to digital
  data.

### PID implementation of Line follower:

- By fusing 6 sensors we have created a range in which sensor output will be
  processed and vary from 0 to 5000 and when bot will be in middle of line then
  the value will be 2500. So goal is to always reach 2500 abd system should
  always be as fast as possible.
- Taken a week for tuning and bot and it worked. 
- For checking the nodes bluetooth sensor used for sending notification when
  node will come.
- Transfered sensor data through cloud by using ESP32. Used firebase Real time
  database for sending the values.
- Latter on realised that for tracing the data Firestore can be used because it
  will store the data by generating different templates and jason file like
  structure and it will be a easy way flto upload data.

### Actuating part:

- 200 RPM  motors with max current capacity 2 Ampere was used. 
- PWM uesed for varing the speed.
- Caster wheel used for providing support.
- L298 motor driver used for providing propper motor control which was driven
  by PID controller.(provide 2A mac current) with dual H-bridge, handle 0-12V.

[L298 motor driver](https://lastminuteengineers.com/l298n-dc-stepper-driver-arduino-tutorial/)

