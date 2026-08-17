# Professional ESP32 Academy

## Introduction

- The ESP32 is a family of **SoC** _(System on a chip)_ developed by Espressif Systems.
A SoC is defined as an integrated circuit that combines multiple cores, such as CPUs, GPUs,
and other functional units, along with memory, I/O ports, and sometimes modems on a single
substrate. This integration has the goal of enhancing performance, reducing power consumption,
and optimizing semiconductor die area compared to traditional motherboard-based architectures.

- 32-bit Architectures: _Xtensa LX6, Xtensa 32-bit LX7, and RISC-V 32-bit_.
- Connectivity: _Wi-Fi, Bluetooth Classic/Low-Energy (LE)/Mesh, IEEE 802.15.4 (Thread, Matter,
and Zigbee)_.


## Documentations

1. [ESP-IDF](https://developer.espressif.com/tags/esp-idf/)
2. [SoCs](https://www.espressif.com/en/products/socs) - Use to look for:
   - Technical Reference Manuals
   - Datasheets
   - Hardware Design Guidelines
3. Other worthwhile readings:
   - [ESP-IDF SDK](https://www.espressif.com/en/products/sdks/esp-idf)
   - [Espressif's Blog](https://developer.espressif.com/blog/)
   - [ESP32 Forums](https://esp32.com/)


## Franzininho WiFi LAB01

#### Resources:

1. MCU ESP32-S2:
   - Xtensa single-core 32-bit LX7, operating up to 240MHz.
   - 128KB ROM, 320KB SRAM, 16KB SRAM in the RTC, 4MB Flash memory.
   - WiFi 802.11 b/g/n.
   - GPIO, SPI, LCD, UART, I2C, I2S, Camera, IR, pulse counter, PWM LED, TWAI(CAN),
   USB 1.1 OTG, ADC, DAC, touch, internal temperature sensor.

2. Pinout:
   - Buses: 40 pins divided into 2x20 buses of 2.54mm.
   - 35 GPIOS.
   - Breadboard compatibility.
   
3. 2 general use-case LEDs.

4. 1 reset and 1 boot buttons.

5. USB: micro USB - OTG 1.1 connector.

6. Power Supply:
   - 5V through USB connection.
   - 5V and GND through bus.
   - 3V3 and GND through bus.

7. Programming: ESP-IDF, Arduino, CircuitPython, MicroPython, Zephyr, NuttX.


## ESP-IDF Basics

- Activate env:

```bash
source "/home/gustavo/.espressif/tools/activate_idf_v6.0.2.sh"
```

- Set this in a `.dir-locals.el` file at the root of an ESP-IDF project:

```elisp
((nil
  . ((eglot-server-programs
      . ((c-ts-mode
          . ("/home/gustavo/.espressif/tools/esp-clang/esp-20.1.1_20250829/esp-clang/bin/clangd"))
         (c-mode
          . ("/home/gustavo/.espressif/tools/esp-clang/esp-20.1.1_20250829/esp-clang/bin/clangd"))
         (c++-ts-mode
          . ("/home/gustavo/.espressif/tools/esp-clang/esp-20.1.1_20250829/esp-clang/bin/clangd"))
         (c++-mode
          . ("/home/gustavo/.espressif/tools/esp-clang/esp-20.1.1_20250829/esp-clang/bin/clangd")))))))
```

1. Main CLI Commands

```bash
idf.py create-project <project_name> # generates a basic initial structure in the project_name directory

idf.py set-target <target> # defines the target MCU for which the project will be compiled for
	
idf.py menuconfig # opens an interactive config UI for adjusting compile options and others for the project

idf.py clean # removes the files generated during the previous compilation, project ready for a new build

idf.py fullclean # removes all generated files, including local project configs, directory returns to initial state

idf.py build # compiles the project and generates the binaries (into build/) that will be loaded into the device

idf.py flash # flashed the complete binary to the ESP (will compile the project if needed, then upload to the connected board)
idf.py -p PORT flash # specifies the serial port to flash the binary
idf.py app-flash # uploads only the application's binary, without flashing other memory segments, e.g., the bootloader
idf.py encrypted-flash # flashes the firmware cryptographed, if cryptography is enabled in the project

idf.py monitor # connects to the ESP serial port and shows the debugging logs in real-time

idf.py erase_flash # removes completely the flash memory of the ESP device, useful to clean all data
```

2. Additional Useful Commands

```bash
idf.py size # shows the flash memory usage of the compiled application, including binary sizes and partitions sizes

idf.py size-components # shows a detailed table with memory usage per component

idf.py reconfigure # generates the configurations of the project again without recompiling

idf.py bootloader # compiles only the project's bootloader

idf.py gdb # initializes GDB for project-debugging

idf.py gdbgui # initializes a GUI for debugging with GDB

idf.py create-component <my_component> # creates a new component inside an existing ESP-IDF project, creating the basics components/my_component structure
```

3. Logging

- ESP-IDF provides a set of macros for logging messages throughout the program's execution, through the header file `"esp_log.h"`.

- 5 levels of logging are defined. Below they are listed, in order of increasing verbosity:
	1. ESP_LOGE - Error
	2. ESP_LOGW - Warning
	3. ESP_LOGI - Info
	4. ESP_LOGD - Debug
	5. ESP_LOGV - Verbose
  
> In each C file that needs logging functionalities, define the **TAG** variable as:

```c
static const char TAG[] = "MyModule";
```

> Then use one of logging macros to produce output, e.g.:

```c
ESP_LOGW(TAG, "Baud rate error %.1f%%. Requested: %d baud, actual: %d baud", error * 100, baud_req, baud_real);

ESP_EARLY_LOGW(TAG, "Early log message %d", i++);

ESP_DRAM_LOGE(DRAM_STR("TAG_IN_DRAM"), "DRAM log message %d", i++);
```

> Result:
```bash
I (112500) MyModule: Baud rate error 1.5%. Requested: 115200 baud, actual: 116928 baud
W (112500) MyModule: Early log message 1
E : TAG_IN_DRAM: DRAM log message 2
```

- Enabling higher verbosity logging levels will automatically enable the lower levels. E.g.:
```c
esp_log_level_set(TAG_ ESP_LOG_INFO); // Enables LOGI, but also LOGW and LOGE since they are below INFO in the verbosity levels
```

- Disable all logs:
```c
esp_log_level_set(TAG, ESP_LOG_NONE);
```


## General Purpose Input Output - GPIO in Microcontrollers

- Allows direct, software-controlled, interaction with external devices. GPIO pins can be configured as input to read signals from sensors, buttons, or other peripherals, or as output to control components like LEDs, motors, and displays. Provides a more flexible and simple way to interface with hardware.

- Each GPIO pin can be configured in one of the following modes:
	1. Input Mode: the pin reads signals from external devices, such as sensors or push buttons. The voltage level (high or low) is interpreted as a binary signal (1 or 0).
	2. Output Mode: the pin sends signals to control devices like LEDs, buzzers, or relays. The microcontroller sets the voltage level (high or low) to activate or deactivate the device.

- To ensure a stable signal when a GPIO pin is set as an input but is not actively driven by an external circuit, pull-up and pull-down resistors are used:
	1. Pull-up resistor: keeps the pin at a HIGH state when no signal is applied.
	2. Pull-down resistor: keeps the pin at a LOW state when no signal is applied.

> These resistors prevent floating states, which can cause unpredictable behavior in digital circuits.

- GPIO pins can generate interrupts, allowing microcontrollers to respond to external events in real time. Interrupts can be triggered on:
	- Rising Edge: when the signal transitions from LOW to HIGH.
	- Falling Edge: when the signal transitions from HIGH to LOW.
	- Both Edges: when a signal changes in either direction.

> Interrupt-driven GPIO significantly improves system efficiency by reducing the need for continuous polling.

- Many GPIO pins support **PWM (Pulse Width Modulation)**, which allows analog-like control over digital outputs. PWM is useful for:
	- Controlling the brightness of LEDs.
	- Adjusting the speed of motors.
	- Generating sound signals in audio applications.

> PWM works by rapidly switching between HIGH and LOW states, adjusting the duty cycle to control the average output voltage.

- Some GPIO pins serve multiple purposes and can be configured for specialized functions such as:
	- **SPI (Serial Peripheral Interface)**
	- **I2C (Inter-Integrated Circuit)**
	- **UART (Universal Asynchronous Receiver-Transmitter)**

> This feature allows microcontrollers to optimize the number of available pins while maintaining versatile functionality.

- GPIO functionalities are available through the header file `"driver/gpio.h"`.

- Example program for handling GPIO as digital outputs:

```c
#include "driver/gpio.h"
#include "freertos/FreeRTOS.h"
#include "freertos/task.h" // needed to access task delay function

#define LED_PIN_1 21
#define LED_PIN_2 33

void app_main(void)
{
	gpio_reset_pin(LED_PIN_1); // resets GPIO to default state, enabling the pin as GPIO
	gpio_set_direction(LED_PIN_1, GPIO_MODE_DEF_OUTPUT); // defines GPIO pin as output
	
	gpio_reset_pin(LED_PIN_2);
	gpio_set_direction(LED_PIN_W, GPIO_MODE_DEF_OUTPUT);
	
	for (;;) {
		gpio_set_level(LED_PIN_1, 1); // sets to HIGH (on)
		vTaskDelay(1000/portTICK_PERIOD_MS); // delays for 1 second
	    gpio_set_level(LED_PIN_2, 0); // sets to LOW (off)
		vTaskDelay(1000/portTICK_PERIOD_MS); // delays for 1 second
		
		gpio_set_level(LED_PIN_1, 0); // sets to LOW (off)
		vTaskDelay(1000/portTICK_PERIOD_MS); // delays for 1 second
		gpio_set_level(LED_PIN_2, 1); // sets to HIGH (on)
		vTaskDelay(1000/portTICK_PERIOD_MS); // delays for 1 second
	}
}
```
