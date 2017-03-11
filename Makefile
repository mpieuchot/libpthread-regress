

CFLAGS+=	-lpthread
CFLAGS+=	-Wall -Werror

PROGS+=		barrier1 barrier2 barrier3 barrier4 barrier5

PROGS+=		condvar1 condvar2 condvar2_1 condvar3 condvar3_1 condvar3_2 \
		condvar3_3 condvar4 condvar5 condvar6 condvar7 condvar8 condvar9

PROGS+=		mutex1 mutex1e mutex1n mutex1r mutex2 mutex3 mutex4 mutex5 \
		mutex6e mutex6r mutex7 mutex7e mutex7n mutex7r mutex8 mutex8e \
		mutex8n mutex8r

PROGS+=		rwlock1 rwlock2 rwlock2_t rwlock3 rwlock3_t rwlock4 rwlock4_t \
		rwlock5 rwlock5_t rwlock6 rwlock6_t rwlock6_t2 rwlock7 rwlock8

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
