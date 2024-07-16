#-----------------------------------------------------------------------------
# This file is part of the 'Camera link gateway'. It is subject to
# the license terms in the LICENSE.txt file found in the top-level directory
# of this distribution and at:
#    https://confluence.slac.stanford.edu/display/ppareg/LICENSE.html.
# No part of the 'Camera link gateway', including this file, may be
# copied, modified, propagated, or distributed except according to the terms
# contained in the LICENSE.txt file.
#-----------------------------------------------------------------------------

import pyrogue as pr
import test_kv260

class uart_bridge(pr.Device):
    def __init__(self,
                 description = "Container for xxx",
                 pollInterval = 1,
            **kwargs):
        super().__init__(description=description, **kwargs)


        self.addRemoteVariables(
            name         = 'SCRATCH',
            description  = 'Scratch register',
            offset       = 0x800,
            bitSize      = 8,
            mode         = 'RW',
            number       = 1,
            stride       = 0,
            pollInterval = pollInterval
        )
        

class Application(pr.Device):
    def __init__(self,**kwargs):
        super().__init__(**kwargs)

        # self.add(uart_bridge(
        #     name         = f'UART_Bridge',
        #     offset       = 0x1_0000,
        #     pollInterval = 0,
        #     hidden       = True,
        # ))

        self.add(test_kv260.zCCM_Registers(offset=0x2_0000))
        self.add(pr.RemoteVariable(
            name         = 'ReadRegisterA',
            offset       = 0x0,
            bitSize      = 32,
            mode         = 'RO',
            pollInterval = 1,
        ))
        self.add(pr.RemoteVariable(
            name         = 'ReadRegisterB',
            offset       = 0x4,
            bitSize      = 32,
            mode         = 'RO',
            pollInterval = 1,
        ))
        self.add(pr.RemoteVariable(
            name         = 'WriteRegisterA',
            offset       = 0x100,
            bitSize      = 32,
            mode         = 'RW',
        ))
        self.add(pr.RemoteVariable(
            name         = 'WriteRegisterB',
            offset       = 0x104,
            bitSize      = 32,
            mode         = 'RW',
        ))
