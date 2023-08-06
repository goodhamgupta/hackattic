docker run --rm -v $PWD:/work -w /work -u $UID:$GID brimstone/fastcoll --prefixfile $1 -o msg1.bin msg2.bin
