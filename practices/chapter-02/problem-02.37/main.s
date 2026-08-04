/*
        Aside Security vulnerability in the XDR library

        In 2002, it was discovered that code supplied by Sun Microsystems to implement the XDR library, a widely used facility for sharing data structures between programs, had a security vulnerability arising from the fact that multiplication can overflow without any notice being given to the program. Code similar to that containing the vulnerability is shown below:

            1 // Illustration of code vulnerability similar to that found in
            2 // Sun's XDR library.
            3 
            4 void* copy_elements(void *ele_src[], int ele_cnt, size_t ele_size) {
            5 	
            6     // Allocate buffer for ele_cnt objects, each of ele_size bytes
            7     // and copy from locations designated by ele_src
            8     
            9     void *result = malloc(ele_cnt * ele_size);
            10    if (result == NULL)
            11        // malloc failed 
            12        return NULL;
            13    void *next = result;
            14    int i;
            15    for (i = 0; i < ele_cnt; i++) {
            16        // Copy object i to destination
            17        memcpy(next, ele_src[i], ele_size);
            18        // Move pointer to next memory region
            19        next += ele_size;
            20    }
            21    return result;
            22 }

        The function copy_elements is designed to copy ele_cnt data structures, each consisting of ele_size bytes into a buffer allocated by the function on line 9. The number of bytes required is computed as ele_cnt * ele_size.

        Imagine, however, that a malicious programmer calls this function with ele_cnt being 1,048,577 (220 + 1) and ele_size being 4,096 (212) with the program compiled for 32 bits. Then the multiplication on line 9 will overflow, causing only 4096 bytes to be allocated, rather than the 4,294,971,392 bytes required to hold that much data. The loop starting at line 15 will attempt to copy all of those bytes, overrunning the end of the allocated buffer, and therefore corrupting other data structures. This could cause the program to crash or otherwise misbehave.

        The Sun code was used by almost every operating system, and in such widely used programs as Internet Explorer and the Kerberos authentication system. The Computer Emergency Response Team (CERT), an organization run by the Carnegie Mellon Software Engineering Institute to track security vulnerabilities and breaches, issued advisory “CA-2002-25,” and many companies rushed to patch their code. Fortunately, there were no reported security breaches caused by this vulnerability.

        A similar vulnerability existed in many implementations of the library function calloc. These have since been patched. Unfortunately, many programmers call allocation functions, such as malloc, using arithmetic expressions as arguments, without checking these expressions for overflow. Writing a reliable version of calloc is left as an exercise (Problem 2.76.)

    You are given the task of patching the vulnerability in the XDR code shown above for the case where both data types int and size_t are 32 bits. You decide to eliminate the possibility of the multiplication overflowing by computing the number of bytes to allocate using data type uint64_t. You replace the original call to malloc (line 9) as follows:

        uint64_t asize =
            ele_cnt * (uint64_t) ele_size;
        void *result = malloc(asize);

    Recall that the argument to malloc has type size_t.

    A. Does your code provide any improvement over the original?
        > in this case size_t is 32 bits wide. asize is correct, but calling aside within malloc() will cast it into 32 bits, which will result in overflow nonetheless.

    B. How would you change the code to eliminate the vulnerability?
        > we can just reject an attempt to allocate more than 2^32 bytes of memory block, since malloc is never supposed to allow this anyway. instead of using multiple mallocs, i personally think it would be wiser to revise the code that sits on top of this function instead in cases where somehow more that 2^32 addresses of memory is needed.

            void* copy_elements(void *ele_src[], int ele_cnt, size_t ele_size) {
                int64_t malloc_size = (int64_t) ele_cnt * (int64_t) ele_size;
                if ((size_t) malloc_size != malloc_size) {
                    // requested space too big
                    return NULL;
                }
                void *result = malloc(malloc_size);
                if (result == NULL)
                    // malloc failed 
                    return NULL;
                void *next = result;
                int i;
                for (i = 0; i < ele_cnt; i++) {
                    // Copy object i to destination
                    memcpy(next, ele_src[i], ele_size);
                    // Move pointer to next memory region
                    next += ele_size;
                }
                return result;
            }
*/