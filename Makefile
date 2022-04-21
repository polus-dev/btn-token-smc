LIBS_PATH='func/lib/stdlib.func' 'func/lib/extlib.func'
JETTON_UTILS = $(shell find 'func/utils' -name '*.func')
OUT_DIR='auto'

build:
	$(info building jetton-wallet.func)
	@func -SPA -o \
		${OUT_DIR}/jetton-wallet-code.fif \
		${LIBS_PATH} ${JETTON_UTILS} \
		./func/jetton-wallet.func

	$(info DONE; output in: ${OUT_DIR})
