import pyrogue as pr
import os

top_level = os.path.realpath(__file__).split('software')[0]

pr.addLibraryPath(top_level+'firmware/submodules/surf/python')
pr.addLibraryPath(top_level+'firmware/submodules/axi-soc-ultra-plus-core/python')
pr.addLibraryPath(top_level+'firmware/python')
