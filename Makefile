test:
	sbcl --noinform --non-interactive \
		--load cl-env.asd \
		--eval '(ql:quickload :cl-env/test)' \
		--eval '(cl-env/test:test-suite)' \
		--eval '(exit)'
