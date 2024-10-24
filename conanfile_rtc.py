from conans import ConanFile

class SPIRVToolsConan(ConanFile):
    name = "spirv-tools"
    version = "0.0.1"
    url = "https://github.com/Esri/SPIRV-Tools/blob/runtimecore"
    license = "https://github.com/Esri/SPIRV-Tools/blob/runtimecore/LICENSE"
    description = "An API and commands for processing SPIR-V modules"

    # RTC specific triple
    settings = "platform_architecture_target"

    def package(self):
        base = self.source_folder
        relative = "3rdparty/SPIRV-Tools"

        # headers
        self.copy("*.h", src=base + "/include", dst=relative + "/include")
        self.copy("*.hpp", src=base + "/include", dst=relative + "/include")
        self.copy("*.h", src=base + "/source/opt", dst=relative + "/source/opt")

        # libraries
        output = "output/" + str(self.settings.platform_architecture_target) + "/staticlib"
        self.copy("*" + self.name + "*", src=base + "/../../" + output, dst=output)