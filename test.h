
#include <sys/time.h>

#include <pthread.h>

#include <err.h>
#include <assert.h>
#include <errno.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

#define Sleep(ms) usleep(ms * 1000)

#define InterlockedIncrement(p)		__sync_add_and_fetch(p, 1)
#define InterlockedExchangeAdd(p, v)	__sync_fetch_and_add(p, v)

struct _timeb {
	time_t		time;
	uint16_t	millitm;
	int16_t		timezone;
	int16_t		dstflag;
};

static inline int
_ftime(struct _timeb *tbp)
{
        struct timezone tz;
        struct timeval t;

        if (gettimeofday(&t, &tz) < 0)
        	err(1, "gettimeofday");
        tbp->millitm = (uint16_t)(t.tv_usec / 1000);
        tbp->time = t.tv_sec;
        tbp->timezone = tz.tz_minuteswest;
        tbp->dstflag = tz.tz_dsttime;

	return 0;
}
