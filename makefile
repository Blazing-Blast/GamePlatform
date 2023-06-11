rwildcard=$(foreach d,$(wildcard $(1:=/*)),$(call rwildcard,$d,$2) $(filter $(subst *,%,$2),$d))

GCC = gcc
GCCFLAGS = -Wall -Wpedantic -Werror -std=c++20 -save-temps -O3

SRCDIR = src
BUILDDIR = build

LDLIBS = Gdi32 stdc++

PRGM  = libless.exe
SRCS := $(call rwildcard, $(SRCDIR), *.cpp, *.c, *.hpp, *.h)
OBJS := $(patsubst $(SRCDIR)%, $(BUILDDIR)%, $(patsubst %.cpp,%.o, $(patsubst %.hpp,%.o, $(patsubst %.c,%.o, $(patsubst %.h,%.o, $(SRCS))))))
DEPS := $(patsubst $(SRCDIR)%, $(BUILDDIR)%, $(OBJS:.o=.d))

.PHONY: all clean

all: $(PRGM)

run: $(PRGM)
	$<

$(PRGM): $(OBJS)
	$(GCC) $(OBJS) $(addprefix -l, $(LDLIBS)) -o $@

$(BUILDDIR)/%.o: $(SRCDIR)/%.cpp $(@D)
	$(GCC) $(GCCFLAGS) -MD -MMD -c $< -o $@

$(BUILDDIR)/%.o: $(SRCDIR)/%.hpp $(@D)
	$(GCC) $(GCCFLAGS) -MD -MMD -c $< -o $@

$(BUILDDIR)/%.o: $(SRCDIR)/%.c $(@D)
	$(GCC) $(GCCFLAGS) -MD -MMD -c $< -o $@

$(BUILDDIR)/%.o: $(SRCDIR)/%.h $(@D)
	$(GCC) $(GCCFLAGS) -MD -MMD -c $< -o $@

$(BUILDDIR)/%/: $(@D)
	mkdir $@

clean:
	powershell.exe "Get-ChildItem * -Include *.o -Recurse | Remove-Item"