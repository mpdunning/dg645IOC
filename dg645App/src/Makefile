TOP=../..

include $(TOP)/configure/CONFIG

PROD_IOC = dg645

DBD += dg645.dbd

dg645_DBD += base.dbd
dg645_DBD += stream.dbd
dg645_DBD += asyn.dbd
dg645_DBD += asSupport.dbd
#dg645_DBD += drvAsynIPPort.dbd
dg645_DBD += drvVxi11.dbd

dg645_SRCS += dg645_registerRecordDeviceDriver.cpp
dg645_SRCS_DEFAULT += dg645Main.cpp

dg645_LIBS += asyn
dg645_LIBS += autosave
dg645_LIBS += stream

dg645_LIBS += $(EPICS_BASE_IOC_LIBS)

include $(TOP)/configure/RULES

