# Create the .ZIP to put on the KV260's /app directory (/dev/mmcblk0p2)

rm -rf python rogue.zip
mkdir python
cd python
cp -rf ../../firmware/python/test_kv260 test_kv260
cp -rf ../../firmware/submodules/axi-soc-ultra-plus-core/python/axi_soc_ultra_plus_core axi_soc_ultra_plus_core
cp -rf ../../firmware/submodules/surf/python/surf surf
cd ..
zip -r -0 rogue.zip python -i '*.py' 
rm -rf python
