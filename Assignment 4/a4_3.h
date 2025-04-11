#ifndef A4_3_H
#define A4_3_H

template<class Type>
int genericSearch(const Type a[], int n, const Type& key) {
    for (int i = 0; i < n; i++) {
        if (a[i] == key) {
            return i;
        }
    }
    return -1;
}

#endif