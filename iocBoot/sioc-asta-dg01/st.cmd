#!../../bin/linux-x86_64/dg645

epicsEnvSet( "STREAM_PROTOCOL_PATH","../../dg645App/Db:.")

< envPaths

cd ${TOP}

dbLoadDatabase "dbd/dg645.dbd"
dg645_registerRecordDeviceDriver pdbbase

epicsEnvSet("P",         "ASTA:DG01")
#epicsEnvSet("IP",        "172.27.248.40")
epicsEnvSet("IP",        "172.27.248.171")
epicsEnvSet("DESC",      "ASTA Bunker")
epicsEnvSet("PROTOFILE", "dg645.proto")
epicsEnvSet("ADDR",      "inst0")
epicsEnvSet("DELAY0",    "0.2")
epicsEnvSet("DELAY1",    "0.1")
epicsEnvSet("SCAN0",     "5 second")
epicsEnvSet("SCAN1",     "2 second")

vxi11Configure( "L0","$(IP)",0,0.0,"$(ADDR)",0,0)

#asynSetTraceMask("L0",-1,0x9)
#asynSetTraceIOMask("L0",-1,0x2)

dbLoadRecords("db/dg645.db","IOCNAME=${IOC},P=$(P),DESC=$(DESC),PROTOFILE=$(PROTOFILE),PORT=P0,L=L0,A=$(ADDR),DELAY0=$(DELAY0),SCAN0=$(SCAN0),DELAY1=$(DELAY1),SCAN1=$(SCAN1)")
dbLoadRecords("db/dg645Ch.db","P=$(P),PROTOFILE=$(PROTOFILE),PORT=P0,L=L0,A=$(ADDR)")
dbLoadRecords("db/asynRecord.db","P=$(P):,R=asyn,PORT=L0,ADDR=0,OMAX=0,IMAX=0")

cd ${TOP}/iocBoot/${IOC}
iocInit()

