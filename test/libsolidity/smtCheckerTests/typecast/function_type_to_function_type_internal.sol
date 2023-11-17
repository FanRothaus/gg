contract C {
	function(uint) returns (uint) a;
	function(uint) returns (uint) b;
	function f(function(uint) returns (uint) g, function(uint) returns (uint) h) internal {
		assert(g(2) == h(2));
		assert(g == h);
	}
	function g() public {
		f(a, b);
	}
}
// ====
// SMTEngine: all
// ----
// Warning 2519: (93-124): This declaration shadows an existing declaration.
// Warning 6031: (179-183): Internal error: Expression undefined for SMT solver.
// Warning 6031: (187-191): Internal error: Expression undefined for SMT solver.
// Warning 7229: (203-209): Assertion checker does not yet implement the type function (uint256) returns (uint256) for comparisons
// Warning 5729: (179-183): BMC does not yet implement this type of function call.
// Warning 5729: (187-191): BMC does not yet implement this type of function call.
// Warning 6328: (172-192): CHC: Assertion violation happens here.
// Warning 6328: (196-210): CHC: Assertion violation happens here.
