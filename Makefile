

CFLAGS+=	-lpthread

PROGS=		mutex1 mutex1e mutex1n mutex1r mutex2 mutex3 \
		mutex4 mutex6e \
		mutex6r mutex7 mutex7e mutex7n mutex7r \
		mutex8 mutex8e mutex8n mutex8r

# Need PTHREAD_ERRORCHECK_MUTEX_INITIALIZER or another variant.
#PROGS+=	mutex5 mutex6es mutex6rs


.for p in ${PROGS}
REGRESS_TARGETS+=	run-regress-${p}
run-regress-${p}: ${p}
	@echo '\n======== $@ ========'
	./${p}
.endfor

REGRESS_MAXTIME?=	30

CLEANFILES+=		*.o ${PROGS}

.include <bsd.regress.mk>
