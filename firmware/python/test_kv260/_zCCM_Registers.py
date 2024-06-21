#-----------------------------------------------------------------------------
# This file is part of the 'LDMX'. It is subject to
# the license terms in the LICENSE.txt file found in the top-level directory
# of this distribution and at:
#    https://confluence.slac.stanford.edu/display/ppareg/LICENSE.html.
# No part of the 'LDMX', including this file, may be
# copied, modified, propagated, or distributed except according to the terms
# contained in the LICENSE.txt file.
#-----------------------------------------------------------------------------

import pyrogue as pr

class zCCM_Registers(pr.Device):
    def __init__( self,**kwargs):
        super().__init__(**kwargs)

        self.add(pr.RemoteVariable(
            name         = 'Scratch',
            description  = 'register to test AXIL interface',
            offset       = 0x04,
            bitSize      = 32,
            mode         = 'RW'
        ))
        
