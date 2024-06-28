import rogue
import rogue.interfaces.memory
import rogue.interfaces.stream
import rogue.hardware.axi

import pyrogue as pr

#import axi_soc_ultra_plus_core as socCore
import test_kv260 as kv260

rogue.Version.minVersion('6.0.0')

class Root(pr.Root):
    def __init__(self,
            ip           = '10.0.0.200', # ETH Host Name (or IP address)
            epics_enable = False,
            epics_prefix = 'kv260_ioc',
            zmqSrvEn     = True,  # Flag to include the ZMQ server
            **kwargs):
        super().__init__(**kwargs)

        self.memMap = rogue.hardware.axi.AxiMemMap('/dev/axi_memory_map')
        #self.srp = rogue.protocols.srp.SrpV3()
        
        self.add(kv260.Application(
            memBase = self.memMap,
            offset  = 0x8000_0000,
            expand  = True,
        ))
