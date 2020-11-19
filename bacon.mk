# Copyright (C) 2017 Unlegacy-Android
# Copyright (C) 2017 The LineageOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# -----------------------------------------------------------------

# HyconOS package
HYCON_TARGET_PACKAGE := $(PRODUCT_OUT)/HyconOS-$(HYCON_BUILD_ID).zip

.PHONY: otapackage bacon
otapackage: $(INTERNAL_OTA_PACKAGE_TARGET)
bacon: otapackage
	$(hide) ln -f $(INTERNAL_OTA_PACKAGE_TARGET) $(HYCON_TARGET_PACKAGE)
	$(hide) $(MD5SUM) $(HYCON_TARGET_PACKAGE) | sed "s|$(PRODUCT_OUT)/||" > $(HYCON_TARGET_PACKAGE).md5sum
        @echo "done"
	@echo -e ${CL_CYN}"=========================-Package Complete-========================="${CL_RST}
        @echo -e ${CL_MAG}" █████   █████ █████ █████   █████████     ███████    ██████   █████"${CL_MAG}
        @echo -e ${CL_MAG}"░░███   ░░███ ░░███ ░░███   ███░░░░░███  ███░░░░███   ░██████ ░░███░"${CL_MAG}
        @echo -e ${CL_MAG}" ░███    ░███  ░░███ ███   ███     ░░░  ███     ░░███ ░███░███ ░███░"${CL_MAG}
        @echo -e ${CL_MAG}" ░███████████   ░░█████   ░███         ░███      ░███ ░███░░███░███░"${CL_MAG}
        @echo -e ${CL_MAG}" ░███░░░░░███    ░░███    ░███         ░███      ░███ ░███ ░░██████░"${CL_MAG}
        @echo -e ${CL_MAG}" ░███    ░███     ░███    ░░███     ███░░███     ███  ░███  ░░█████░"${CL_MAG}
        @echo -e ${CL_MAG}" █████   █████    █████    ░░█████████  ░░░███████░   █████  ░░█████"${CL_MAG}
        @echo -e ${CL_MAG}" ░░░░░   ░░░░░    ░░░░░      ░░░░░░░░░     ░░░░░░░    ░░░░░    ░░░░░"${CL_MAG}
	@echo -e ${CL_RST}""${CL_RST}
	@echo -e ${CL_RST}""${CL_RST}
	@echo -e ${CL_RST}"                   Your Build Is Ready! Enjoy the HyconOS.          "${CL_RST}
        @echo -e ${CL_CYN}"=============================-Package Details-============================"${CL_RST}
	@echo -e ${CL_CYN}"ZipName        : "${CL_MAG}" $(HYCON_TARGET_PACKAGE)"${CL_RST}
	@echo -e ${CL_CYN}"MD5            : "${CL_MAG}" $(shell cat $(HYCON_TARGET_PACKAGE).md5sum | awk '{print $$1}')"${CL_RST}
	@echo -e ${CL_CYN}"Size           : "${CL_MAG}" $(shell du -hs $(HYCON_TARGET_PACKAGE) | awk '{print $$1}')"${CL_RST}
	@echo -e ${CL_CYN}"==========================================================================="${CL_RST}
