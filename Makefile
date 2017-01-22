

CFLAGS+=	-lpthread

PROGS=		mutex1 mutex1e mutex1n mutex1r mutex2 mutex3 mutex4 mutex5 \
		mutex6e mutex6r mutex7 mutex7e mutex7n mutex7r mutex8 mutex8e \
		mutex8n mutex8r

PROGS+=		condvar1 condvar2 condvar2_1 condvar3 condvar3_1 condvar3_2 \
		condvar3_3 condvar4 condvar5 condvar6 condvar7 condvar8 condvar9

PROGS+=		stress1

.for p in ${PROGS}
REGRESS_TARGETS+=	run-regress-${p}
run-regress-${p}: ${p}
	@echo '\n======== $@ ========'
	./${p}
.endfor

REGRESS_MAXTIME?=	30

CLEANFILES+=		*.o ${PROGS}

.include <bsd.regress.mk>
