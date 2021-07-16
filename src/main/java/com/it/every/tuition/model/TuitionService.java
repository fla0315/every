package com.it.every.tuition.model;

import java.util.List;

public interface TuitionService {
	
	List<TuitionVO>selectByStuNo (String stuNo);
	
	
}
