################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../src/cf_hdmi.c \
../src/main.c \
../src/transmitter.c 

LD_SRCS += \
../src/lscript.ld 

OBJS += \
./src/cf_hdmi.o \
./src/main.o \
./src/transmitter.o 

C_DEPS += \
./src/cf_hdmi.d \
./src/main.d \
./src/transmitter.d 


# Each subdirectory must supply rules for building sources it contributes
src/%.o: ../src/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: MicroBlaze gcc compiler'
	mb-gcc -Wall -O0 -g3 -I"/work/team_psx/labs/lab2_sound/sample_HDMI/cf_adv7511_vc707/SDK/SDK_Workspace/sw/inc" -I"/work/team_psx/labs/lab2_sound/sample_HDMI/cf_adv7511_vc707/SDK/SDK_Workspace/sw/src" -c -fmessage-length=0 -I../../bsp/microblaze_0/include -mlittle-endian -mxl-barrel-shift -mxl-pattern-compare -mno-xl-soft-div -mcpu=v8.40.b -mno-xl-soft-mul -mxl-multiply-high -Wl,--no-relax -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


