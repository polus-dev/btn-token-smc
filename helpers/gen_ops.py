import binascii


def print_ops_func(methods):
    query_range = (1, 2**31 - 1)

    for m in methods:
        crc = hex(binascii.crc32(bytes(m, "utf-8")) & 0x7fffffff)

        if not(query_range[0] <= int(crc, 16) <= query_range[1]):
            print(f"ERROR: {crc} doesn't fit into query_range: {query_range}")
            break

        print(
            f'int op::{m}()'
            f'{" " * (len(max(methods)) + 4 - len(m))}'
            f'asm "{crc} PUSHINT";'
        )


def main():
    print_ops_func(("mint", "buy_tokens", "withdraw"))


if __name__ == "__main__":
    main()
