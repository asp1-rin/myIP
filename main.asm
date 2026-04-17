; IP Address Printer (nasm -f win64)
extern printf, WSAStartup, gethostname, gethostbyname, inet_ntoa, WSACleanup

section .data
    wsadata    times 400 db 0
    hostname   times 256 db 0
    fmt_ip     db "My IP Address: %s", 10, 0

section .text
    global main

main:
    sub rsp, 40          ; Shadow space and stack alignment

    ; 1. Initialize Winsock
    mov rdx, wsadata
    mov rcx, 0x202       ; Winsock version 2.2
    call WSAStartup

    ; 2. Get local hostname
    mov rdx, 256
    mov rcx, hostname
    call gethostname

    ; 3. Get host information (IP)
    mov rcx, hostname
    call gethostbyname   ; rax returns pointer to hostent structure

    ; 4. Extract IP from structure
    ; rax + 24 points to h_addr_list in hostent structure
    mov rax, [rax + 24]  ; Pointer to h_addr_list
    mov rax, [rax]       ; Get first address pointer
    mov rcx, [rax]       ; Load actual address
    call inet_ntoa       ; Convert 32-bit IP to string

    ; 5. Print result
    mov rdx, rax         ; Converted IP string
    mov rcx, fmt_ip
    call printf

    call WSACleanup
    add rsp, 40
    ret