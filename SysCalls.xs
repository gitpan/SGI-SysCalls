#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"

#include <limits.h>
#include <sys/types.h>
#include <sys/prctl.h>
#include <sys/schedctl.h>

static int
not_here(s)
char *s;
{
    croak("%s not implemented on this architecture", s);
    return -1;
}

static double
constant(name, arg)
	char *name;
	int arg;
{
    errno = 0;
    errno = EINVAL;
    return 0;

not_there:
    errno = ENOENT;
    return 0;
}

MODULE = SGI::SysCalls		PACKAGE = SGI::SysCalls

double
constant(name,arg)
	char *		name
	int		arg

int
sginap(ticks)
	long		ticks
