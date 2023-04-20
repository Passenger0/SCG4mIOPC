cd pastry-cook
solc --abi *.sol > tmp.abi
sed '1,3d' tmp.abi >registry.abi
solc --bin *.sol > tmp.bin
sed '1,3d' tmp.bin >registry.bin
rm ./tmp.abi
rm ./tmp.bin

abigen --bin=registry.bin --abi=registry.abi --pkg=contracts --out=registry.go

cd ../paper-review
solc --abi *.sol > tmp.abi
sed '1,3d' tmp.abi >registry.abi
solc --bin *.sol > tmp.bin
sed '1,3d' tmp.bin >registry.bin
rm ./tmp.abi
rm ./tmp.bin

abigen --bin=registry.bin --abi=registry.abi --pkg=contracts --out=registry.go

cd ../online-education
solc --abi *.sol > tmp.abi
sed '1,3d' tmp.abi >registry.abi
solc --bin *.sol > tmp.bin
sed '1,3d' tmp.bin >registry.bin
rm ./tmp.abi
rm ./tmp.bin

abigen --bin=registry.bin --abi=registry.abi --pkg=contracts --out=registry.go

cd ../booking-travel
solc --abi *.sol > tmp.abi
sed '1,3d' tmp.abi >registry.abi
solc --bin *.sol > tmp.bin
sed '1,3d' tmp.bin >registry.bin
rm ./tmp.abi
rm ./tmp.bin

abigen --bin=registry.bin --abi=registry.abi --pkg=contracts --out=registry.go

cd ../supply-chain
solc --abi *.sol > tmp.abi
sed '1,3d' tmp.abi >registry.abi
solc --bin *.sol > tmp.bin
sed '1,3d' tmp.bin >registry.bin
rm ./tmp.abi
rm ./tmp.bin

abigen --bin=registry.bin --abi=registry.abi --pkg=contracts --out=registry.go