cmake_minimum_required(VERSION 3.4.1)

set(GTB_SRC gtb/gtb-probe.c gtb/gtb-dec.c gtb/gtb-att.c gtb/sysport/sysport.c gtb/compression/wrap.c 
	gtb/compression/huffman/hzip.c gtb/compression/lzma/LzmaEnc.c gtb/compression/lzma/LzmaDec.c 
	gtb/compression/lzma/Alloc.c gtb/compression/lzma/LzFind.c gtb/compression/lzma/Lzma86Enc.c 
	gtb/compression/lzma/Lzma86Dec.c gtb/compression/lzma/Bra86.c gtb/compression/zlib/zcompress.c 
	gtb/compression/zlib/uncompr.c gtb/compression/zlib/inflate.c gtb/compression/zlib/deflate.c 
	gtb/compression/zlib/adler32.c gtb/compression/zlib/crc32.c gtb/compression/zlib/infback.c 
	gtb/compression/zlib/inffast.c gtb/compression/zlib/inftrees.c gtb/compression/zlib/trees.c 
	gtb/compression/zlib/zutil.c gtb/compression/liblzf/lzf_c.c gtb/compression/liblzf/lzf_d.c 
	gtb/GtbProbe.cpp)
add_library(gtb SHARED ${GTB_SRC})
target_include_directories(gtb PRIVATE gtb/sysport gtb/compression gtb/compression/liblzf gtb/compression/zlib gtb/compression/lzma gtb/compression/huffman)
target_compile_options(gtb PRIVATE -O3 -DZ_PREFIX -DNDEBUG -DTARGET_OS=android -D__ANDROID__)

set(RTB_SRC rtb/bitBoard.cpp rtb/material.cpp rtb/moveGen.cpp rtb/position.cpp rtb/rtb-probe.cpp rtb/tbprobe.cpp rtb/RtbProbe.cpp)
add_library(rtb SHARED ${RTB_SRC})
target_compile_options(rtb PRIVATE -O3 -std=c++11 -DNDEBUG -DTARGET_OS=android -D__ANDROID__ -D__STDC_INT64__ -D_GLIBCXX_USE_C99_STDINT_TR1 -D_GLIBCXX_HAS_GTHREADS -D_GLIBCXX__PTHREADS)

add_library(nativeutil SHARED nativeutil.cpp)
target_compile_options(nativeutil PRIVATE -O3)
