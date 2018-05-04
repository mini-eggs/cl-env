test:
	sbcl --noinform --non-interactive \
		 --load cl-env.asd \
		 --eval '(ql:quickload :cl-env/test)' \
		 --eval '(cl-env/test:test-suite)' \
		 --eval '(exit)'

test_c_go:
	cd playground && \
	go build -buildmode=c-archive main.go && \
	gcc -pthread -fPIC main.c -L . -l:main.a -o main && \
	./main

build_so:
	cd playground && \
	go build -buildmode=c-archive main.go && \
	gcc -c -pthread -fPIC main.c -L . -l:main.a -o main.o && \
	gcc main.o -shared -L . -l:main.a -o main.so

clean:
	cd playground && \
	rm main.so main.a main.h main.o
