################################################################################
# Automatically-generated file. Do not edit!
################################################################################

-include ../makefile.init

RM := rm -rf

# All of the sources participating in the build are defined here
-include sources.mk
-include src/subdir.mk
-include subdir.mk
-include objects.mk

ifneq ($(MAKECMDGOALS),clean)
ifneq ($(strip $(C_DEPS)),)
-include $(C_DEPS)
endif
ifneq ($(strip $(S_UPPER_DEPS)),)
-include $(S_UPPER_DEPS)
endif
endif

-include ../makefile.defs

# Add inputs and outputs from these tool invocations to the build variables 
ELFSIZE += \
sw.elf.size \

ELFCHECK += \
sw.elf.elfcheck \


# All Target
all: sw.elf secondary-outputs

# Tool invocations
sw.elf: $(OBJS) ../src/lscript.ld $(USER_OBJS)
	@echo 'Building target: $@'
	@echo 'Invoking: MicroBlaze gcc linker'
	mb-gcc -L"/work/team_psx/labs/lab2_sound/sample_HDMI/cf_adv7511_vc707/SDK/SDK_Workspace/sw/lib" -Wl,-T -Wl,../src/lscript.ld -L../../bsp/microblaze_0/lib -mlittle-endian -mxl-barrel-shift -mxl-pattern-compare -mno-xl-soft-div -mcpu=v8.40.b -mno-xl-soft-mul -mxl-multiply-high -Wl,--no-relax -o "sw.elf" $(OBJS) $(USER_OBJS) $(LIBS)
	@echo 'Finished building target: $@'
	@echo ' '

sw.elf.size: sw.elf
	@echo 'Invoking: MicroBlaze Print Size'
	mb-size sw.elf  |tee "sw.elf.size"
	@echo 'Finished building: $@'
	@echo ' '

sw.elf.elfcheck: sw.elf
	@echo 'Invoking: Xilinx ELF Check'
	elfcheck sw.elf -hw ../../hw/system.xml -pe microblaze_0  |tee "sw.elf.elfcheck"
	@echo 'Finished building: $@'
	@echo ' '

# Other Targets
clean:
	-$(RM) $(OBJS)$(C_DEPS)$(EXECUTABLES)$(ELFSIZE)$(ELFCHECK)$(S_UPPER_DEPS) sw.elf
	-@echo ' '

secondary-outputs: $(ELFSIZE) $(ELFCHECK)

.PHONY: all clean dependents
.SECONDARY:

-include ../makefile.targets
