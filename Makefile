LDFLAGS=
PREFIX=.

CPPFLAGS=-g -D_REENTRANT -I./src -I/Library/Frameworks/ParallelsVirtualizationSDK.framework/Helpers/SdkWrap -I/Library/Frameworks/ParallelsVirtualizationSDK.framework/Headers -DDYN_API_WRAP=1

prltype: prltype.o common.o SdkWrap.o
	clang++ $(LDFLAGS) -o $(PREFIX)/bin/prltype out/prltype.o out/common.o out/SdkWrap.o
	chmod 555 $(PREFIX)/bin/prltype

prltype.o: setup
	clang++ $(CPPFLAGS) -c src/prltype.cpp -o out/prltype.o

common.o: setup
	clang++ $(CPPFLAGS) -c src/common.cpp -o out/common.o

SdkWrap.o: setup
	clang++ $(CPPFLAGS) -c /Library/Frameworks/ParallelsVirtualizationSDK.framework/Helpers/SdkWrap/SdkWrap.cpp -o out/SdkWrap.o

setup:
	mkdir -p $(PREFIX)/bin
	mkdir -p out

clean:
	rm -rf $(PREFIX)/bin
	rm -rf out
