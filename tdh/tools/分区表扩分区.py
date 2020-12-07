'''
作用：生成扩分区的语句
'''

def add_partition(tables, start, n):
    end = (start // 100 + 1) * 10000 + 101 if str(start)[4:] == "12" else (start + 1) * 100 + 1
    for j in tables:
        for i in range(n):
            se = str(end)
            result = 'alter table ' + j + ' add partition p_' + str(start) + ' values less than (\''\
                 + se[0:4] + '-' + se[4:6] + '-' + se[6:] + '\');'
            print(result)
            if str(start)[4:] == "12":
                start = (start // 100 + 1) * 100
            if str(end)[4:6] == "12":
                end = (end // 10000 + 1) * 10000 + 1
            start += 1
            end += 100

add_partition(['t1'], 201812, 30)



-------------------------------------------------------------------------------------------------------
def gen_date(s):
    start = s
    while True:
        year = start // 100 + (1 if (start % 100) % 12 == 0 else 0)
        month = (start % 100) % 12 + 1
        next = year * 100 + month
        yield start, next * 100 + 1
        start = next


def add_partitions(tables, start, n):
    ls = []
    f = gen_date(start)
    for i in range(n):
        x = next(f)
        ls.extend(list(map(lambda p: "alter table " + p + " add partition p_" + str(x[0]) + " values less than ('"
                                 + str(x[1])[0:4] + '-' + str(x[1])[4:6] + '-' + str(x[1])[6:] + "');", tables)))

    for i in ls:
        print(i)

add_partitions(['t1', 't2', 't3'], 201812, 2)


