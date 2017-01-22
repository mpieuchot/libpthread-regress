
#include <sys/time.h>

#include <pthread.h>

#include <assert.h>
#include <errno.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

#define Sleep(ms) usleep(ms * 1000)

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
                return -1;
        tbp->millitm = (uint16_t)(t.tv_usec / 1000);
        tbp->time = t.tv_sec;
        tbp->timezone = tz.tz_minuteswest;
        tbp->dstflag = tz.tz_dsttime;

	return 0;
}
