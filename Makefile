

CFLAGS+=	-lpthread

PROGS=		mutex1 mutex1e mutex1n mutex1r mutex2 mutex3 \
		mutex4 mutex6 mutex6e mutex6n \
		mutex6r mutex6s mutex7 mutex7e mutex7n mutex7r \

# Need PTHREAD_ERRORCHECK_MUTEX_INITIALIZER or another variant.
#PROGS+=	mutex2e mutex2r mutex3e mutex3r mutex5 mutex6es mutex6rs

# Need ftime(3), <sys/timeb.h>
#PROGS+= 	mutex8 mutex8e mutex8n mutex8r


.for p in ${PROGS}
REGRESS_TARGETS+=	run-regress-${p}
run-regress-${p}: ${p}
	@echo '\n======== $@ ========'
	./${p}
.endfor

REGRESS_MAXTIME?=	30

CLEANFILES+=		*.o ${PROGS}

.include <bsd.regress.mk>
