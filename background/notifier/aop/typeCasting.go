package aop

func MysqlBool(flag bool) int8 {
	if flag {
		return 1
	}
	return 0
}
