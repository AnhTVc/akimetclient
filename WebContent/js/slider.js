(function(h, g, c, j, d, k, l) {/*! Jssor */
			new (function() {
			});
			var e = {
				dd : function(a) {
					return -c.cos(a * c.PI) / 2 + .5
				},
				bd : function(a) {
					return a
				},
				qg : function(a) {
					return a * a
				},
				Zc : function(a) {
					return -a * (a - 2)
				},
				rg : function(a) {
					return (a *= 2) < 1 ? 1 / 2 * a * a : -1 / 2
							* (--a * (a - 2) - 1)
				},
				ug : function(a) {
					return a * a * a
				},
				pg : function(a) {
					return (a -= 1) * a * a + 1
				},
				ng : function(a) {
					return (a *= 2) < 1 ? 1 / 2 * a * a * a : 1 / 2 * ((a -= 2)
							* a * a + 2)
				},
				mg : function(a) {
					return a * a * a * a
				},
				lg : function(a) {
					return -((a -= 1) * a * a * a - 1)
				},
				kg : function(a) {
					return (a *= 2) < 1 ? 1 / 2 * a * a * a * a : -1 / 2
							* ((a -= 2) * a * a * a - 2)
				},
				hg : function(a) {
					return a * a * a * a * a
				},
				fg : function(a) {
					return (a -= 1) * a * a * a * a + 1
				},
				ef : function(a) {
					return (a *= 2) < 1 ? 1 / 2 * a * a * a * a * a
							: 1 / 2 * ((a -= 2) * a * a * a * a + 2)
				},
				df : function(a) {
					return 1 - c.cos(c.PI / 2 * a)
				},
				cf : function(a) {
					return c.sin(c.PI / 2 * a)
				},
				bf : function(a) {
					return -1 / 2 * (c.cos(c.PI * a) - 1)
				},
				af : function(a) {
					return a == 0 ? 0 : c.pow(2, 10 * (a - 1))
				},
				Ze : function(a) {
					return a == 1 ? 1 : -c.pow(2, -10 * a) + 1
				},
				Ve : function(a) {
					return a == 0 || a == 1 ? a : (a *= 2) < 1 ? 1 / 2 * c.pow(
							2, 10 * (a - 1))
							: 1 / 2 * (-c.pow(2, -10 * --a) + 2)
				},
				wf : function(a) {
					return -(c.sqrt(1 - a * a) - 1)
				},
				vf : function(a) {
					return c.sqrt(1 - (a -= 1) * a)
				},
				uf : function(a) {
					return (a *= 2) < 1 ? -1 / 2 * (c.sqrt(1 - a * a) - 1)
							: 1 / 2 * (c.sqrt(1 - (a -= 2) * a) + 1)
				},
				tf : function(a) {
					if (!a || a == 1)
						return a;
					var b = .3, d = .075;
					return -(c.pow(2, 10 * (a -= 1)) * c.sin((a - d) * 2 * c.PI
							/ b))
				},
				sf : function(a) {
					if (!a || a == 1)
						return a;
					var b = .3, d = .075;
					return c.pow(2, -10 * a) * c.sin((a - d) * 2 * c.PI / b)
							+ 1
				},
				rf : function(a) {
					if (!a || a == 1)
						return a;
					var b = .45, d = .1125;
					return (a *= 2) < 1 ? -.5 * c.pow(2, 10 * (a -= 1))
							* c.sin((a - d) * 2 * c.PI / b) : c.pow(2, -10
							* (a -= 1))
							* c.sin((a - d) * 2 * c.PI / b) * .5 + 1
				},
				qf : function(a) {
					var b = 1.70158;
					return a * a * ((b + 1) * a - b)
				},
				pf : function(a) {
					var b = 1.70158;
					return (a -= 1) * a * ((b + 1) * a + b) + 1
				},
				of : function(a) {
					var b = 1.70158;
					return (a *= 2) < 1 ? 1 / 2 * a * a
							* (((b *= 1.525) + 1) * a - b) : 1 / 2 * ((a -= 2)
							* a * (((b *= 1.525) + 1) * a + b) + 2)
				},
				Ac : function(a) {
					return 1 - e.Rb(1 - a)
				},
				Rb : function(a) {
					return a < 1 / 2.75 ? 7.5625 * a * a
							: a < 2 / 2.75 ? 7.5625 * (a -= 1.5 / 2.75) * a
									+ .75 : a < 2.5 / 2.75 ? 7.5625
									* (a -= 2.25 / 2.75) * a + .9375 : 7.5625
									* (a -= 2.625 / 2.75) * a + .984375
				},
				nf : function(a) {
					return a < 1 / 2 ? e.Ac(a * 2) * .5
							: e.Rb(a * 2 - 1) * .5 + .5
				},
				mf : function() {
					return 1 - c.abs(1)
				},
				lf : function(a) {
					return 1 - c.cos(a * c.PI * 2)
				},
				kf : function(a) {
					return c.sin(a * c.PI * 2)
				},
				Ff : function(a) {
					return 1 - ((a *= 2) < 1 ? (a = 1 - a) * a * a : (a -= 1)
							* a * a)
				},
				og : function(a) {
					return (a *= 2) < 1 ? a * a * a : (a = 2 - a) * a * a
				}
			}, f = {
				xf : e.dd,
				yf : e.bd,
				zf : e.qg,
				Af : e.Zc,
				Bf : e.rg,
				Ef : e.ug,
				jf : e.pg,
				hf : e.ng,
				gf : e.mg,
				Le : e.lg,
				Me : e.kg,
				Ne : e.hg,
				Oe : e.fg,
				Pe : e.ef,
				Qe : e.df,
				Re : e.cf,
				vd : e.bf,
				Se : e.af,
				ff : e.Ze,
				We : e.Ve,
				Xe : e.wf,
				vg : e.vf,
				sg : e.uf,
				tg : e.tf,
				Rf : e.sf,
				Jf : e.rf,
				Kf : e.qf,
				cg : e.pf,
				Mf : e.of,
				Nf : e.Ac,
				Of : e.Rb,
				Qf : e.nf,
				ag : e.mf,
				Tf : e.lf,
				Vf : e.kf,
				Wf : e.Ff,
				Xf : e.og
			};
			var b = new function() {
				var f = this, Ab = /\S+/g, F = 1, yb = 2, fb = 3, eb = 4, jb = 5, G, r = 0, i = 0, s = 0, X = 0, z = 0, I = navigator, ob = I.appName, o = I.userAgent, p = parseFloat;
				function Ib() {
					if (!G) {
						G = {
							Cf : "ontouchstart" in h || "createTouch" in g
						};
						var a;
						if (I.pointerEnabled || (a = I.msPointerEnabled))
							G.td = a ? "msTouchAction" : "touchAction"
					}
					return G
				}
				function v(j) {
					if (!r) {
						r = -1;
						if (ob == "Microsoft Internet Explorer"
								&& !!h.attachEvent && !!h.ActiveXObject) {
							var e = o.indexOf("MSIE");
							r = F;
							s = p(o.substring(e + 5, o.indexOf(";", e)));/*@cc_on X=@_jscript_version@*/
							;
							i = g.documentMode || s
						} else if (ob == "Netscape" && !!h.addEventListener) {
							var d = o.indexOf("Firefox"), b = o
									.indexOf("Safari"), f = o.indexOf("Chrome"), c = o
									.indexOf("AppleWebKit");
							if (d >= 0) {
								r = yb;
								i = p(o.substring(d + 8))
							} else if (b >= 0) {
								var k = o.substring(0, b).lastIndexOf("/");
								r = f >= 0 ? eb : fb;
								i = p(o.substring(k + 1, b))
							} else {
								var a = /Trident\/.*rv:([0-9]{1,}[\.0-9]{0,})/i
										.exec(o);
								if (a) {
									r = F;
									i = s = p(a[1])
								}
							}
							if (c >= 0)
								z = p(o.substring(c + 12))
						} else {
							var a = /(opera)(?:.*version|)[ \/]([\w.]+)/i
									.exec(o);
							if (a) {
								r = jb;
								i = p(a[2])
							}
						}
					}
					return j == r
				}
				function q() {
					return v(F)
				}
				function Q() {
					return q() && (i < 6 || g.compatMode == "BackCompat")
				}
				function db() {
					return v(fb)
				}
				function ib() {
					return v(jb)
				}
				function vb() {
					return db() && z > 534 && z < 535
				}
				function J() {
					v();
					return z > 537 || i > 42 || r == F && i >= 11
				}
				function O() {
					return q() && i < 9
				}
				function wb(a) {
					var b, c;
					return function(f) {
						if (!b) {
							b = d;
							var e = a.substr(0, 1).toUpperCase() + a.substr(1);
							n([ a ].concat([ "WebKit", "ms", "Moz", "O",
									"webkit" ]), function(g, d) {
								var b = a;
								if (d)
									b = g + e;
								if (f.style[b] != l)
									return c = b
							})
						}
						return c
					}
				}
				function ub(b) {
					var a;
					return function(c) {
						a = a || wb(b)(c) || b;
						return a
					}
				}
				var K = ub("transform");
				function nb(a) {
					return {}.toString.call(a)
				}
				var kb = {};
				n([ "Boolean", "Number", "String", "Function", "Array", "Date",
						"RegExp", "Object" ], function(a) {
					kb["[object " + a + "]"] = a.toLowerCase()
				});
				function n(b, d) {
					var a, c;
					if (nb(b) == "[object Array]") {
						for (a = 0; a < b.length; a++)
							if (c = d(b[a], a, b))
								return c
					} else
						for (a in b)
							if (c = d(b[a], a, b))
								return c
				}
				function C(a) {
					return a == j ? String(a) : kb[nb(a)] || "object"
				}
				function lb(a) {
					for ( var b in a)
						return d
				}
				function A(a) {
					try {
						return C(a) == "object"
								&& !a.nodeType
								&& a != a.window
								&& (!a.constructor || {}.hasOwnProperty.call(
										a.constructor.prototype,
										"isPrototypeOf"))
					} catch (b) {
					}
				}
				function u(a, b) {
					return {
						x : a,
						y : b
					}
				}
				function rb(b, a) {
					setTimeout(b, a || 0)
				}
				function H(b, d, c) {
					var a = !b || b == "inherit" ? "" : b;
					n(d, function(c) {
						var b = c.exec(a);
						if (b) {
							var d = a.substr(0, b.index), e = a.substr(b.index
									+ b[0].length + 1, a.length - 1);
							a = d + e
						}
					});
					a = c + (!a.indexOf(" ") ? "" : " ") + a;
					return a
				}
				function tb(b, a) {
					if (i < 9)
						b.style.filter = a
				}
				f.Df = Ib;
				f.wd = q;
				f.Ue = db;
				f.Te = J;
				f.pd = O;
				wb("transform");
				f.Vc = function() {
					return i
				};
				f.Sc = rb;
				function Y(a) {
					a.constructor === Y.caller && a.xc
							&& a.xc.apply(a, Y.caller.arguments)
				}
				f.xc = Y;
				f.kb = function(a) {
					if (f.Ye(a))
						a = g.getElementById(a);
					return a
				};
				function t(a) {
					return a || h.event
				}
				f.zc = t;
				f.bc = function(b) {
					b = t(b);
					var a = b.target || b.srcElement || g;
					if (a.nodeType == 3)
						a = f.Bc(a);
					return a
				};
				f.Fc = function(a) {
					a = t(a);
					return {
						x : a.pageX || a.clientX || 0,
						y : a.pageY || a.clientY || 0
					}
				};
				function D(c, d, a) {
					if (a !== l)
						c.style[d] = a == l ? "" : a;
					else {
						var b = c.currentStyle || c.style;
						a = b[d];
						if (a == "" && h.getComputedStyle) {
							b = c.ownerDocument.defaultView.getComputedStyle(c,
									j);
							b && (a = b.getPropertyValue(d) || b[d])
						}
						return a
					}
				}
				function ab(b, c, a, d) {
					if (a !== l) {
						if (a == j)
							a = "";
						else
							d && (a += "px");
						D(b, c, a)
					} else
						return p(D(b, c))
				}
				function m(c, a) {
					var d = a ? ab : D, b;
					if (a & 4)
						b = ub(c);
					return function(e, f) {
						return d(e, b ? b(e) : c, f, a & 2)
					}
				}
				function Db(b) {
					if (q() && s < 9) {
						var a = /opacity=([^)]*)/.exec(b.style.filter || "");
						return a ? p(a[1]) / 100 : 1
					} else
						return p(b.style.opacity || "1")
				}
				function Fb(b, a, f) {
					if (q() && s < 9) {
						var h = b.style.filter || "", i = new RegExp(
								/[\s]*alpha\([^\)]*\)/g), e = c.round(100 * a), d = "";
						if (e < 100 || f)
							d = "alpha(opacity=" + e + ") ";
						var g = H(h, [ i ], d);
						tb(b, g)
					} else
						b.style.opacity = a == 1 ? "" : c.round(a * 100) / 100
				}
				var L = {
					ab : [ "rotate" ],
					R : [ "rotateX" ],
					T : [ "rotateY" ],
					Lb : [ "skewX" ],
					Kb : [ "skewY" ]
				};
				if (!J())
					L = B(L, {
						s : [ "scaleX", 2 ],
						z : [ "scaleY", 2 ],
						N : [ "translateZ", 1 ]
					});
				function M(d, a) {
					var c = "";
					if (a) {
						if (q() && i && i < 10) {
							delete a.R;
							delete a.T;
							delete a.N
						}
						b.f(a, function(d, b) {
							var a = L[b];
							if (a) {
								var e = a[1] || 0;
								if (N[b] != d)
									c += " " + a[0] + "(" + d
											+ ([ "deg", "px", "" ])[e] + ")"
							}
						});
						if (J()) {
							if (a.bb || a.cb || a.N)
								c += " translate3d(" + (a.bb || 0) + "px,"
										+ (a.cb || 0) + "px," + (a.N || 0)
										+ "px)";
							if (a.s == l)
								a.s = 1;
							if (a.z == l)
								a.z = 1;
							if (a.s != 1 || a.z != 1)
								c += " scale3d(" + a.s + ", " + a.z + ", 1)"
						}
					}
					d.style[K(d)] = c
				}
				f.vc = m("transformOrigin", 4);
				f.Hf = m("backfaceVisibility", 4);
				f.Gf = m("transformStyle", 4);
				f.Lf = m("perspective", 6);
				f.If = m("perspectiveOrigin", 4);
				f.eg = function(a, b) {
					if (q() && s < 9 || s < 10 && Q())
						a.style.zoom = b == 1 ? "" : b;
					else {
						var c = K(a), f = "scale(" + b + ")", e = a.style[c], g = new RegExp(
								/[\s]*scale\(.*?\)/g), d = H(e, [ g ], f);
						a.style[c] = d
					}
				};
				f.dc = function(b, a) {
					return function(c) {
						c = t(c);
						var e = c.type, d = c.relatedTarget
								|| (e == "mouseout" ? c.toElement
										: c.fromElement);
						(!d || d !== a && !f.gg(a, d)) && b(c)
					}
				};
				f.a = function(a, d, b, c) {
					a = f.kb(a);
					if (a.addEventListener) {
						d == "mousewheel"
								&& a.addEventListener("DOMMouseScroll", b, c);
						a.addEventListener(d, b, c)
					} else if (a.attachEvent) {
						a.attachEvent("on" + d, b);
						c && a.setCapture && a.setCapture()
					}
				};
				f.K = function(a, c, d, b) {
					a = f.kb(a);
					if (a.removeEventListener) {
						c == "mousewheel"
								&& a
										.removeEventListener("DOMMouseScroll",
												d, b);
						a.removeEventListener(c, d, b)
					} else if (a.detachEvent) {
						a.detachEvent("on" + c, d);
						b && a.releaseCapture && a.releaseCapture()
					}
				};
				f.Jb = function(a) {
					a = t(a);
					a.preventDefault && a.preventDefault();
					a.cancel = d;
					a.returnValue = k
				};
				f.ig = function(a) {
					a = t(a);
					a.stopPropagation && a.stopPropagation();
					a.cancelBubble = d
				};
				f.L = function(d, c) {
					var a = [].slice.call(arguments, 2), b = function() {
						var b = a.concat([].slice.call(arguments, 0));
						return c.apply(d, b)
					};
					return b
				};
				f.jg = function(a, b) {
					if (b == l)
						return a.textContent || a.innerText;
					var c = g.createTextNode(b);
					f.lc(a);
					a.appendChild(c)
				};
				f.yb = function(d, c) {
					for (var b = [], a = d.firstChild; a; a = a.nextSibling)
						(c || a.nodeType == 1) && b.push(a);
					return b
				};
				function mb(a, c, e, b) {
					b = b || "u";
					for (a = a ? a.firstChild : j; a; a = a.nextSibling)
						if (a.nodeType == 1) {
							if (U(a, b) == c)
								return a;
							if (!e) {
								var d = mb(a, c, e, b);
								if (d)
									return d
							}
						}
				}
				f.F = mb;
				function S(a, d, f, b) {
					b = b || "u";
					var c = [];
					for (a = a ? a.firstChild : j; a; a = a.nextSibling)
						if (a.nodeType == 1) {
							U(a, b) == d && c.push(a);
							if (!f) {
								var e = S(a, d, f, b);
								if (e.length)
									c = c.concat(e)
							}
						}
					return c
				}
				function gb(a, c, d) {
					for (a = a ? a.firstChild : j; a; a = a.nextSibling)
						if (a.nodeType == 1) {
							if (a.tagName == c)
								return a;
							if (!d) {
								var b = gb(a, c, d);
								if (b)
									return b
							}
						}
				}
				f.dg = gb;
				f.bg = function(b, a) {
					return b.getElementsByTagName(a)
				};
				function B() {
					var e = arguments, d, c, b, a, g = 1 & e[0], f = 1 + g;
					d = e[f - 1] || {};
					for (; f < e.length; f++)
						if (c = e[f])
							for (b in c) {
								a = c[b];
								if (a !== l) {
									a = c[b];
									var h = d[b];
									d[b] = g && (A(h) || A(a)) ? B(g, {}, h, a)
											: a
								}
							}
					return d
				}
				f.I = B;
				function Z(f, g) {
					var d = {}, c, a, b;
					for (c in f) {
						a = f[c];
						b = g[c];
						if (a !== b) {
							var e;
							if (A(a) && A(b)) {
								a = Z(a, b);
								e = !lb(a)
							}
							!e && (d[c] = a)
						}
					}
					return d
				}
				f.Mc = function(a) {
					return C(a) == "function"
				};
				f.Ye = function(a) {
					return C(a) == "string"
				};
				f.Wb = function(a) {
					return !isNaN(p(a)) && isFinite(a)
				};
				f.f = n;
				f.Pf = A;
				function R(a) {
					return g.createElement(a)
				}
				f.Hb = function() {
					return R("DIV")
				};
				f.Sf = function() {
					return R("SPAN")
				};
				f.qd = function() {
				};
				function V(b, c, a) {
					if (a == l)
						return b.getAttribute(c);
					b.setAttribute(c, a)
				}
				function U(a, b) {
					return V(a, b) || V(a, "data-" + b)
				}
				f.q = V;
				f.j = U;
				function x(b, a) {
					if (a == l)
						return b.className;
					b.className = a
				}
				f.ud = x;
				function qb(b) {
					var a = {};
					n(b, function(b) {
						a[b] = b
					});
					return a
				}
				function sb(b, a) {
					return b.match(a || Ab)
				}
				function P(b, a) {
					return qb(sb(b || "", a))
				}
				f.Uf = sb;
				function bb(b, c) {
					var a = "";
					n(c, function(c) {
						a && (a += b);
						a += c
					});
					return a
				}
				function E(a, c, b) {
					x(a, bb(" ", B(Z(P(x(a)), P(c)), P(b))))
				}
				f.Bc = function(a) {
					return a.parentNode
				};
				f.Z = function(a) {
					f.X(a, "none")
				};
				f.V = function(a, b) {
					f.X(a, b ? "none" : "")
				};
				f.Yf = function(b, a) {
					b.removeAttribute(a)
				};
				f.Zf = function() {
					return q() && i < 10
				};
				f.Ke = function(d, a) {
					if (a)
						d.style.clip = "rect(" + c.round(a.k || a.v || 0)
								+ "px " + c.round(a.D) + "px " + c.round(a.E)
								+ "px " + c.round(a.i || a.u || 0) + "px)";
					else if (a !== l) {
						var g = d.style.cssText, f = [
								new RegExp(/[\s]*clip: rect\(.*?\)[;]?/i),
								new RegExp(/[\s]*cliptop: .*?[;]?/i),
								new RegExp(/[\s]*clipright: .*?[;]?/i),
								new RegExp(/[\s]*clipbottom: .*?[;]?/i),
								new RegExp(/[\s]*clipleft: .*?[;]?/i) ], e = H(
								g, f, "");
						b.Ab(d, e)
					}
				};
				f.Q = function() {
					return +new Date
				};
				f.M = function(b, a) {
					b.appendChild(a)
				};
				f.Bb = function(b, a, c) {
					(c || a.parentNode).insertBefore(b, a)
				};
				f.Cb = function(b, a) {
					a = a || b.parentNode;
					a && a.removeChild(b)
				};
				f.Bd = function(a, b) {
					n(a, function(a) {
						f.Cb(a, b)
					})
				};
				f.lc = function(a) {
					f.Bd(f.yb(a, d), a)
				};
				f.Dd = function(a, b) {
					var c = f.Bc(a);
					b & 1 && f.C(a, (f.n(c) - f.n(a)) / 2);
					b & 2 && f.G(a, (f.p(c) - f.p(a)) / 2)
				};
				f.fc = function(b, a) {
					return parseInt(b, a || 10)
				};
				f.Ld = p;
				f.gg = function(b, a) {
					var c = g.body;
					while (a && b !== a && c !== a)
						try {
							a = a.parentNode
						} catch (d) {
							return k
						}
					return b === a
				};
				function W(d, c, b) {
					var a = d.cloneNode(!c);
					!b && f.Yf(a, "id");
					return a
				}
				f.vb = W;
				f.wb = function(e, g) {
					var a = new Image;
					function b(e, d) {
						f.K(a, "load", b);
						f.K(a, "abort", c);
						f.K(a, "error", c);
						g && g(a, d)
					}
					function c(a) {
						b(a, d)
					}
					if (ib() && i < 11.6 || !e)
						b(!e);
					else {
						f.a(a, "load", b);
						f.a(a, "abort", c);
						f.a(a, "error", c);
						a.src = e
					}
				};
				f.Ed = function(d, a, e) {
					var c = d.length + 1;
					function b(b) {
						c--;
						if (a && b && b.src == a.src)
							a = b;
						!c && e && e(a)
					}
					n(d, function(a) {
						f.wb(a.src, b)
					});
					b()
				};
				f.yd = function(a, g, i, h) {
					if (h)
						a = W(a);
					var c = S(a, g);
					if (!c.length)
						c = b.bg(a, g);
					for (var f = c.length - 1; f > -1; f--) {
						var d = c[f], e = W(i);
						x(e, x(d));
						b.Ab(e, d.style.cssText);
						b.Bb(e, d);
						b.Cb(d)
					}
					return a
				};
				function Gb(a) {
					var k = this, p = "", r = [ "av", "pv", "ds", "dn" ], e = [], q, j = 0, h = 0, d = 0;
					function i() {
						E(a, q, e[d || j || h & 2 || h]);
						b.Y(a, "pointer-events", d ? "none" : "")
					}
					function c() {
						j = 0;
						i();
						f.K(g, "mouseup", c);
						f.K(g, "touchend", c);
						f.K(g, "touchcancel", c)
					}
					function o(a) {
						if (d)
							f.Jb(a);
						else {
							j = 4;
							i();
							f.a(g, "mouseup", c);
							f.a(g, "touchend", c);
							f.a(g, "touchcancel", c)
						}
					}
					k.zd = function(a) {
						if (a === l)
							return h;
						h = a & 2 || a & 1;
						i()
					};
					k.yc = function(a) {
						if (a === l)
							return !d;
						d = a ? 0 : 3;
						i()
					};
					k.W = a = f.kb(a);
					var m = b.Uf(x(a));
					if (m)
						p = m.shift();
					n(r, function(a) {
						e.push(p + a)
					});
					q = bb(" ", e);
					e.unshift("");
					f.a(a, "mousedown", o);
					f.a(a, "touchstart", o)
				}
				f.Vb = function(a) {
					return new Gb(a)
				};
				f.Y = D;
				f.Nb = m("overflow");
				f.G = m("top", 2);
				f.C = m("left", 2);
				f.n = m("width", 2);
				f.p = m("height", 2);
				f.xd = m("marginLeft", 2);
				f.Nd = m("marginTop", 2);
				f.H = m("position");
				f.X = m("display");
				f.A = m("zIndex", 1);
				f.oc = function(b, a, c) {
					if (a != l)
						Fb(b, a, c);
					else
						return Db(b)
				};
				f.Ab = function(a, b) {
					if (b != l)
						a.style.cssText = b;
					else
						return a.style.cssText
				};
				var T = {
					zb : f.oc,
					k : f.G,
					i : f.C,
					qb : f.n,
					ub : f.p,
					tb : f.H,
					Dg : f.X,
					sb : f.A
				};
				function w(g, k) {
					var e = O(), b = J(), d = vb(), h = K(g);
					function i(b, d, a) {
						var e = b.gb(u(-d / 2, -a / 2)), f = b.gb(u(d / 2,
								-a / 2)), g = b.gb(u(d / 2, a / 2)), h = b
								.gb(u(-d / 2, a / 2));
						b.gb(u(300, 300));
						return u(c.min(e.x, f.x, g.x, h.x) + d / 2, c.min(e.y,
								f.y, g.y, h.y)
								+ a / 2)
					}
					function a(d, a) {
						a = a || {};
						var n = a.N || 0, p = (a.R || 0) % 360, q = (a.T || 0) % 360, u = (a.ab || 0) % 360, k = a.s, m = a.z, g = a.Cg;
						if (k == l)
							k = 1;
						if (m == l)
							m = 1;
						if (g == l)
							g = 1;
						if (e) {
							n = 0;
							p = 0;
							q = 0;
							g = 0
						}
						var c = new Cb(a.bb, a.cb, n);
						c.R(p);
						c.T(q);
						c.Pd(u);
						c.ne(a.Lb, a.Kb);
						c.tc(k, m, g);
						if (b) {
							c.pb(a.u, a.v);
							d.style[h] = c.re()
						} else if (!X || X < 9) {
							var o = "", j = {
								x : 0,
								y : 0
							};
							if (a.P)
								j = i(c, a.P, a.db);
							f.Nd(d, j.y);
							f.xd(d, j.x);
							o = c.se();
							var s = d.style.filter, t = new RegExp(
									/[\s]*progid:DXImageTransform\.Microsoft\.Matrix\([^\)]*\)/g), r = H(
									s, [ t ], o);
							tb(d, r)
						}
					}
					w = function(e, c) {
						c = c || {};
						var h = c.u, i = c.v, g;
						n(T, function(a, b) {
							g = c[b];
							g !== l && a(e, g)
						});
						f.Ke(e, c.g);
						if (!b) {
							h != l && f.C(e, (c.Kc || 0) + h);
							i != l && f.G(e, (c.Pc || 0) + i)
						}
						if (c.ze)
							if (d)
								rb(f.L(j, M, e, c));
							else
								a(e, c)
					};
					f.Db = M;
					if (d)
						f.Db = w;
					if (e)
						f.Db = a;
					else if (!b)
						a = M;
					f.O = w;
					w(g, k)
				}
				f.Db = w;
				f.O = w;
				function Cb(i, k, o) {
					var d = this, b = [ 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0,
							i || 0, k || 0, o || 0, 1 ], h = c.sin, g = c.cos, l = c.tan;
					function f(a) {
						return a * c.PI / 180
					}
					function n(a, b) {
						return {
							x : a,
							y : b
						}
					}
					function m(c, e, l, m, o, r, t, u, w, z, A, C, E, b, f, k,
							a, g, i, n, p, q, s, v, x, y, B, D, F, d, h, j) {
						return [ c * a + e * p + l * x + m * F,
								c * g + e * q + l * y + m * d,
								c * i + e * s + l * B + m * h,
								c * n + e * v + l * D + m * j,
								o * a + r * p + t * x + u * F,
								o * g + r * q + t * y + u * d,
								o * i + r * s + t * B + u * h,
								o * n + r * v + t * D + u * j,
								w * a + z * p + A * x + C * F,
								w * g + z * q + A * y + C * d,
								w * i + z * s + A * B + C * h,
								w * n + z * v + A * D + C * j,
								E * a + b * p + f * x + k * F,
								E * g + b * q + f * y + k * d,
								E * i + b * s + f * B + k * h,
								E * n + b * v + f * D + k * j ]
					}
					function e(c, a) {
						return m.apply(j, (a || b).concat(c))
					}
					d.tc = function(a, c, d) {
						if (a != 1 || c != 1 || d != 1)
							b = e([ a, 0, 0, 0, 0, c, 0, 0, 0, 0, d, 0, 0, 0,
									0, 1 ])
					};
					d.pb = function(a, c, d) {
						b[12] += a || 0;
						b[13] += c || 0;
						b[14] += d || 0
					};
					d.R = function(c) {
						if (c) {
							a = f(c);
							var d = g(a), i = h(a);
							b = e([ 1, 0, 0, 0, 0, d, i, 0, 0, -i, d, 0, 0, 0,
									0, 1 ])
						}
					};
					d.T = function(c) {
						if (c) {
							a = f(c);
							var d = g(a), i = h(a);
							b = e([ d, 0, -i, 0, 0, 1, 0, 0, i, 0, d, 0, 0, 0,
									0, 1 ])
						}
					};
					d.Pd = function(c) {
						if (c) {
							a = f(c);
							var d = g(a), i = h(a);
							b = e([ d, i, 0, 0, -i, d, 0, 0, 0, 0, 1, 0, 0, 0,
									0, 1 ])
						}
					};
					d.ne = function(a, c) {
						if (a || c) {
							i = f(a);
							k = f(c);
							b = e([ 1, l(k), 0, 0, l(i), 1, 0, 0, 0, 0, 1, 0,
									0, 0, 0, 1 ])
						}
					};
					d.gb = function(c) {
						var a = e(b, [ 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, c.x,
								c.y, 0, 1 ]);
						return n(a[12], a[13])
					};
					d.re = function() {
						return "matrix3d(" + b.join(",") + ")"
					};
					d.se = function() {
						return "progid:DXImageTransform.Microsoft.Matrix(M11="
								+ b[0] + ", M12=" + b[4] + ", M21=" + b[1]
								+ ", M22=" + b[5]
								+ ", SizingMethod='auto expand')"
					}
				}
				new function() {
					var a = this;
					function b(d, g) {
						for (var j = d[0].length, i = d.length, h = g[0].length, f = [], c = 0; c < i; c++)
							for (var k = f[c] = [], b = 0; b < h; b++) {
								for (var e = 0, a = 0; a < j; a++)
									e += d[c][a] * g[a][b];
								k[b] = e
							}
						return f
					}
					a.s = function(b, c) {
						return a.Dc(b, c, 0)
					};
					a.z = function(b, c) {
						return a.Dc(b, 0, c)
					};
					a.Dc = function(a, c, d) {
						return b(a, [ [ c, 0 ], [ 0, d ] ])
					};
					a.gb = function(d, c) {
						var a = b(d, [ [ c.x ], [ c.y ] ]);
						return u(a[0][0], a[1][0])
					}
				};
				var N = {
					Kc : 0,
					Pc : 0,
					u : 0,
					v : 0,
					fb : 1,
					s : 1,
					z : 1,
					ab : 0,
					R : 0,
					T : 0,
					bb : 0,
					cb : 0,
					N : 0,
					Lb : 0,
					Kb : 0
				};
				f.wc = function(a) {
					var c = a || {};
					if (a)
						if (b.Mc(a))
							c = {
								qc : c
							};
						else if (b.Mc(a.g))
							c.g = {
								qc : a.g
							};
					return c
				};
				function pb(c, a) {
					var b = {};
					n(c, function(c, d) {
						var e = c;
						if (a[d] != l)
							if (f.Wb(c))
								e = c + a[d];
							else
								e = pb(c, a[d]);
						b[d] = e
					});
					return b
				}
				f.Ce = pb;
				f.De = function(k, m, x, q, z, A, n) {
					var a = m;
					if (k) {
						a = {};
						for ( var g in m) {
							var B = A[g] || 1, w = z[g] || [ 0, 1 ], f = (x - w[0])
									/ w[1];
							f = c.min(c.max(f, 0), 1);
							f = f * B;
							var u = c.floor(f);
							if (f != u)
								f -= u;
							var h = q.qc || e.dd, i, C = k[g], o = m[g];
							if (b.Wb(o)) {
								h = q[g] || h;
								var y = h(f);
								i = C + o * y
							} else {
								i = b.I({
									Ib : {}
								}, k[g]);
								var v = q[g] || {};
								b.f(o.Ib || o, function(d, a) {
									h = v[a] || v.qc || h;
									var c = h(f), b = d * c;
									i.Ib[a] = b;
									i[a] += b
								})
							}
							a[g] = i
						}
						var t = b.f(m, function(b, a) {
							return N[a] != l
						});
						t && b.f(N, function(c, b) {
							if (a[b] == l && k[b] !== l)
								a[b] = k[b]
						});
						if (t) {
							if (a.fb)
								a.s = a.z = a.fb;
							a.P = n.P;
							a.db = n.db;
							a.ze = d
						}
					}
					if (m.g && n.pb) {
						var p = a.g.Ib, s = (p.k || 0) + (p.E || 0), r = (p.i || 0)
								+ (p.D || 0);
						a.i = (a.i || 0) + r;
						a.k = (a.k || 0) + s;
						a.g.i -= r;
						a.g.D -= r;
						a.g.k -= s;
						a.g.E -= s
					}
					if (a.g && b.Zf() && !a.g.k && !a.g.i && !a.g.v && !a.g.u
							&& a.g.D == n.P && a.g.E == n.db)
						a.g = j;
					return a
				}
			};
			function n() {
				var a = this, d = [];
				function i(a, b) {
					d.push({
						ec : a,
						cc : b
					})
				}
				function g(a, c) {
					b.f(d, function(b, e) {
						b.ec == a && b.cc === c && d.splice(e, 1)
					})
				}
				a.nb = a.addEventListener = i;
				a.removeEventListener = g;
				a.l = function(a) {
					var c = [].slice.call(arguments, 1);
					b.f(d, function(b) {
						b.ec == a && b.cc.apply(h, c)
					})
				}
			}
			var m = function(z, C, i, J, M, L) {
				z = z || 0;
				var a = this, q, n, o, u, A = 0, G, H, F, B, y = 0, g = 0, m = 0, D, l, f, e, p, w = [], x;
				function O(a) {
					f += a;
					e += a;
					l += a;
					g += a;
					m += a;
					y += a
				}
				function t(o) {
					var h = o;
					if (p && (h >= e || h <= f))
						h = ((h - f) % p + p) % p + f;
					if (!D || u || g != h) {
						var j = c.min(h, e);
						j = c.max(j, f);
						if (!D || u || j != m) {
							if (L) {
								var k = (j - l) / (C || 1);
								if (i.Ge)
									k = 1 - k;
								var n = b.De(M, L, k, G, F, H, i);
								if (x)
									b.f(n, function(b, a) {
										x[a] && x[a](J, b)
									});
								else
									b.O(J, n)
							}
							a.Zb(m - l, j - l);
							m = j;
							b.f(w, function(b, c) {
								var a = o < g ? w[w.length - c - 1] : b;
								a.B(m - y)
							});
							var r = g, q = m;
							g = h;
							D = d;
							a.Gb(r, q)
						}
					}
				}
				function E(a, b, d) {
					b && a.Fb(e);
					if (!d) {
						f = c.min(f, a.Xb() + y);
						e = c.max(e, a.Eb() + y)
					}
					w.push(a)
				}
				var r = h.requestAnimationFrame
						|| h.webkitRequestAnimationFrame
						|| h.mozRequestAnimationFrame
						|| h.msRequestAnimationFrame;
				if (b.Ue() && b.Vc() < 7)
					r = j;
				r = r || function(a) {
					b.Sc(a, i.od)
				};
				function I() {
					if (q) {
						var d = b.Q(), e = c.min(d - A, i.nd), a = g + e * o;
						A = d;
						if (a * o >= n * o)
							a = n;
						t(a);
						if (!u && a * o >= n * o)
							K(B);
						else
							r(I)
					}
				}
				function s(h, i, j) {
					if (!q) {
						q = d;
						u = j;
						B = i;
						h = c.max(h, f);
						h = c.min(h, e);
						n = h;
						o = n < g ? -1 : 1;
						a.md();
						A = b.Q();
						r(I)
					}
				}
				function K(b) {
					if (q) {
						u = q = B = k;
						a.Uc();
						b && b()
					}
				}
				a.kd = function(a, b, c) {
					s(a ? g + a : e, b, c)
				};
				a.cd = s;
				a.hb = K;
				a.Qd = function(a) {
					s(a)
				};
				a.S = function() {
					return g
				};
				a.Xc = function() {
					return n
				};
				a.ob = function() {
					return m
				};
				a.B = t;
				a.pb = function(a) {
					t(g + a)
				};
				a.Yc = function() {
					return q
				};
				a.Sd = function(a) {
					p = a
				};
				a.Fb = O;
				a.jb = function(a, b) {
					E(a, 0, b)
				};
				a.Tb = function(a) {
					E(a, 1)
				};
				a.Ud = function(a) {
					e += a
				};
				a.Xb = function() {
					return f
				};
				a.Eb = function() {
					return e
				};
				a.Gb = a.md = a.Uc = a.Zb = b.qd;
				a.Sb = b.Q();
				i = b.I({
					od : 16,
					nd : 50
				}, i);
				p = i.ad;
				x = i.Vd;
				f = l = z;
				e = z + C;
				H = i.Wd || {};
				F = i.Xd || {};
				G = b.wc(i.U)
			};
			new (function() {
			});
			var i = function(p, fc) {
				var f = this;
				function Bc() {
					var a = this;
					m.call(a, -1e8, 2e8);
					a.ge = function() {
						var b = a.ob(), d = c.floor(b), f = t(d), e = b
								- c.floor(b);
						return {
							eb : f,
							he : d,
							tb : e
						}
					};
					a.Gb = function(b, a) {
						var e = c.floor(a);
						if (e != a && a > b)
							e++;
						Tb(e, d);
						f.l(i.ie, t(a), t(b), a, b)
					}
				}
				function Ac() {
					var a = this;
					m.call(a, 0, 0, {
						ad : r
					});
					b.f(C, function(b) {
						D & 1 && b.Sd(r);
						a.Tb(b);
						b.Fb(kb / bc)
					})
				}
				function zc() {
					var a = this, b = Ub.W;
					m.call(a, -1, 2, {
						U : e.bd,
						Vd : {
							tb : Zb
						},
						ad : r
					}, b, {
						tb : 1
					}, {
						tb : -2
					});
					a.hc = b
				}
				function mc(o, n) {
					var b = this, e, g, h, l, c;
					m.call(b, -1e8, 2e8, {
						nd : 100
					});
					b.md = function() {
						M = d;
						R = j;
						f.l(i.Ie, t(w.S()), w.S())
					};
					b.Uc = function() {
						M = k;
						l = k;
						var a = w.ge();
						f.l(i.xe, t(w.S()), w.S());
						!a.tb && Dc(a.he, s)
					};
					b.Gb = function(i, f) {
						var b;
						if (l)
							b = c;
						else {
							b = g;
							if (h) {
								var d = f / h;
								b = a.ed(d) * (g - e) + e
							}
						}
						w.B(b)
					};
					b.Qb = function(a, d, c, f) {
						e = a;
						g = d;
						h = c;
						w.B(a);
						b.B(0);
						b.cd(c, f)
					};
					b.ce = function(a) {
						l = d;
						c = a;
						b.kd(a, j, d)
					};
					b.ae = function(a) {
						c = a
					};
					w = new Bc;
					w.jb(o);
					w.jb(n)
				}
				function oc() {
					var c = this, a = Xb();
					b.A(a, 0);
					b.Y(a, "pointerEvents", "none");
					c.W = a;
					c.Mb = function() {
						b.Z(a);
						b.lc(a)
					}
				}
				function xc(o, g) {
					var e = this, q, L, v, l, y = [], x, B, W, G, Q, F, h, w, p;
					m.call(e, -u, u + 1, {});
					function E(a) {
						q && q.jd();
						T(o, a, 0);
						F = d;
						q = new I.J(o, I, b.Ld(b.j(o, "idle")) || lc);
						q.B(0)
					}
					function Z() {
						q.Sb < I.Sb && E()
					}
					function M(p, r, o) {
						if (!G) {
							G = d;
							if (l && o) {
								var h = o.width, c = o.height, n = h, m = c;
								if (h && c && a.ib) {
									if (a.ib & 3
											&& (!(a.ib & 4) || h > K || c > J)) {
										var j = k, q = K / J * c / h;
										if (a.ib & 1)
											j = q > 1;
										else if (a.ib & 2)
											j = q < 1;
										n = j ? h * J / c : K;
										m = j ? J : c * K / h
									}
									b.n(l, n);
									b.p(l, m);
									b.G(l, (J - m) / 2);
									b.C(l, (K - n) / 2)
								}
								b.H(l, "absolute");
								f.l(i.Td, g)
							}
						}
						b.Z(r);
						p && p(e)
					}
					function Y(b, c, d, f) {
						if (f == R && s == g && N)
							if (!Cc) {
								var a = t(b);
								A.de(a, g, c, e, d);
								c.Rd();
								U.Fb(a - U.Xb() - 1);
								U.B(a);
								z.Qb(b, b, 0)
							}
					}
					function bb(b) {
						if (b == R && s == g) {
							if (!h) {
								var a = j;
								if (A)
									if (A.eb == g)
										a = A.fe();
									else
										A.Mb();
								Z();
								h = new vc(o, g, a, q);
								h.Wc(p)
							}
							!h.Yc() && h.Ub()
						}
					}
					function S(d, f, l) {
						if (d == g) {
							if (d != f)
								C[f] && C[f].Zd();
							else
								!l && h && h.le();
							p && p.yc();
							var m = R = b.Q();
							e.wb(b.L(j, bb, m))
						} else {
							var k = c.min(g, d), i = c.max(g, d), o = c.min(i
									- k, k + r - i), n = u + a.we - 1;
							(!Q || o <= n) && e.wb()
						}
					}
					function db() {
						if (s == g && h) {
							h.hb();
							p && p.me();
							p && p.Fe();
							h.rd()
						}
					}
					function eb() {
						s == g && h && h.hb()
					}
					function ab(a) {
						!P && f.l(i.Ee, g, a)
					}
					function O() {
						p = w.pInstance;
						h && h.Wc(p)
					}
					e.wb = function(c, a) {
						a = a || v;
						if (y.length && !G) {
							b.V(a);
							if (!W) {
								W = d;
								f.l(i.Be, g);
								b.f(y, function(a) {
									if (!b.q(a, "src")) {
										a.src = b.j(a, "src2");
										b.X(a, a["display-origin"])
									}
								})
							}
							b.Ed(y, l, b.L(j, M, c, a))
						} else
							M(c, a)
					};
					e.Ae = function() {
						var h = g;
						if (a.Ec < 0)
							h -= r;
						var d = h + a.Ec * tc;
						if (D & 2)
							d = t(d);
						if (!(D & 1) && !ib)
							d = c.max(0, c.min(d, r - u));
						if (d != g) {
							if (A) {
								var e = A.be(r);
								if (e) {
									var i = R = b.Q(), f = C[t(d)];
									return f.wb(b.L(j, Y, d, f, e, i), v)
								}
							}
							cb(d)
						}
					};
					e.Yb = function() {
						S(g, g, d)
					};
					e.Zd = function() {
						p && p.me();
						p && p.Fe();
						e.Ic();
						h && h.ye();
						h = j;
						E()
					};
					e.Rd = function() {
						b.Z(o)
					};
					e.Ic = function() {
						b.V(o)
					};
					e.He = function() {
						p && p.yc()
					};
					function T(a, c, e) {
						if (b.q(a, "jssor-slider"))
							return;
						if (!F) {
							if (a.tagName == "IMG") {
								y.push(a);
								if (!b.q(a, "src")) {
									Q = d;
									a["display-origin"] = b.X(a);
									b.Z(a)
								}
							}
							b.pd() && b.A(a, (b.A(a) || 0) + 1)
						}
						var f = b.yb(a);
						b.f(f,
								function(f) {
									var h = f.tagName, i = b.j(f, "u");
									if (i == "player" && !w) {
										w = f;
										if (w.pInstance)
											O();
										else
											b.a(w, "dataavailable", O)
									}
									if (i == "caption") {
										if (c) {
											b.vc(f, b.j(f, "to"));
											b.Hf(f, b.j(f, "bf"));
											b.j(f, "3d")
													&& b.Gf(f, "preserve-3d")
										} else if (!b.wd()) {
											var g = b.vb(f, k, d);
											b.Bb(g, f, a);
											b.Cb(f, a);
											f = g;
											c = d
										}
									} else if (!F && !e && !l) {
										if (h == "A") {
											if (b.j(f, "u") == "image")
												l = b.dg(f, "IMG");
											else
												l = b.F(f, "image", d);
											if (l) {
												x = f;
												b.X(x, "block");
												b.O(x, V);
												B = b.vb(x, d);
												b.H(x, "relative");
												b.oc(B, 0);
												b.Y(B, "backgroundColor",
														"#000")
											}
										} else if (h == "IMG"
												&& b.j(f, "u") == "image")
											l = f;
										if (l) {
											l.border = 0;
											b.O(l, V)
										}
									}
									T(f, c, e + 1)
								})
					}
					e.Zb = function(c, b) {
						var a = u - b;
						Zb(L, a)
					};
					e.eb = g;
					n.call(e);
					b.Lf(o, b.j(o, "p"));
					b.If(o, b.j(o, "po"));
					var H = b.F(o, "thumb", d);
					if (H) {
						b.vb(H);
						b.Z(H)
					}
					b.V(o);
					v = b.vb(gb);
					b.A(v, 1e3);
					b.a(o, "click", ab);
					E(d);
					e.ee = l;
					e.Lc = B;
					e.hc = L = o;
					b.M(L, v);
					f.nb(203, S);
					f.nb(28, eb);
					f.nb(24, db)
				}
				function vc(y, g, p, q) {
					var a = this, n = 0, u = 0, h, j, e, c, l, t, r, o = C[g];
					m.call(a, 0, 0);
					function v() {
						b.lc(L);
						cc && l && o.Lc && b.M(L, o.Lc);
						b.V(L, !l && o.ee)
					}
					function w() {
						a.Ub()
					}
					function x(b) {
						r = b;
						a.hb();
						a.Ub()
					}
					a.Ub = function() {
						var b = a.ob();
						if (!B && !M && !r && s == g) {
							if (!b) {
								if (h && !l) {
									l = d;
									a.rd(d);
									f.l(i.Od, g, n, u, h, c)
								}
								v()
							}
							var k, p = i.Nc;
							if (b != c)
								if (b == e)
									k = c;
								else if (b == j)
									k = e;
								else if (!b)
									k = j;
								else
									k = a.Xc();
							f.l(p, g, b, n, j, e, c);
							var m = N && (!E || F);
							if (b == c)
								(e != c && !(E & 12) || m) && o.Ae();
							else
								(m || b != e) && a.cd(k, w)
						}
					};
					a.le = function() {
						e == c && e == a.ob() && a.B(j)
					};
					a.ye = function() {
						A && A.eb == g && A.Mb();
						var b = a.ob();
						b < c && f.l(i.Nc, g, -b - 1, n, j, e, c)
					};
					a.rd = function(a) {
						p && b.Nb(lb, a && p.uc.Bg ? "" : "hidden")
					};
					a.Zb = function(b, a) {
						if (l && a >= h) {
							l = k;
							v();
							o.Ic();
							A.Mb();
							f.l(i.ve, g, n, u, h, c)
						}
						f.l(i.ue, g, a, n, j, e, c)
					};
					a.Wc = function(a) {
						if (a && !t) {
							t = a;
							a.nb($JssorPlayer$.Yd, x)
						}
					};
					p && a.Tb(p);
					h = a.Eb();
					a.Tb(q);
					j = h + q.Qc;
					e = h + q.Rc;
					c = a.Eb()
				}
				function Kb(a, c, d) {
					b.C(a, c);
					b.G(a, d)
				}
				function Zb(c, b) {
					var a = x > 0 ? x : fb, d = zb * b * (a & 1), e = Ab * b
							* (a >> 1 & 1);
					Kb(c, d, e)
				}
				function Pb() {
					qb = M;
					Ib = z.Xc();
					G = w.S()
				}
				function gc() {
					Pb();
					if (B || !F && E & 12) {
						z.hb();
						f.l(i.te)
					}
				}
				function ec(f) {
					if (!B && (F || !(E & 12)) && !z.Yc()) {
						var d = w.S(), b = c.ceil(G);
						if (f && c.abs(H) >= a.Hc) {
							b = c.ceil(d);
							b += jb
						}
						if (!(D & 1))
							b = c.min(r - u, c.max(b, 0));
						var e = c.abs(b - d);
						e = 1 - c.pow(1 - e, 5);
						if (!P && qb)
							z.Qd(Ib);
						else if (d == b) {
							tb.He();
							tb.Yb()
						} else
							z.Qb(d, b, e * Vb)
					}
				}
				function Hb(a) {
					!b.j(b.bc(a), "nodrag") && b.Jb(a)
				}
				function rc(a) {
					Yb(a, 1)
				}
				function Yb(a, c) {
					a = b.zc(a);
					var l = b.bc(a);
					if (!O && !b.j(l, "nodrag") && sc()
							&& (!c || a.touches.length == 1)) {
						B = d;
						yb = k;
						R = j;
						b.a(g, c ? "touchmove" : "mousemove", Bb);
						b.Q();
						P = 0;
						gc();
						if (!qb)
							x = 0;
						if (c) {
							var h = a.touches[0];
							ub = h.clientX;
							vb = h.clientY
						} else {
							var e = b.Fc(a);
							ub = e.x;
							vb = e.y
						}
						H = 0;
						hb = 0;
						jb = 0;
						f.l(i.qe, t(G), G, a)
					}
				}
				function Bb(e) {
					if (B) {
						e = b.zc(e);
						var f;
						if (e.type != "mousemove") {
							var l = e.touches[0];
							f = {
								x : l.clientX,
								y : l.clientY
							}
						} else
							f = b.Fc(e);
						if (f) {
							var j = f.x - ub, k = f.y - vb;
							if (c.floor(G) != G)
								x = x || fb & O;
							if ((j || k) && !x) {
								if (O == 3)
									if (c.abs(k) > c.abs(j))
										x = 2;
									else
										x = 1;
								else
									x = O;
								if (ob && x == 1 && c.abs(k) - c.abs(j) > 3)
									yb = d
							}
							if (x) {
								var a = k, i = Ab;
								if (x == 1) {
									a = j;
									i = zb
								}
								if (!(D & 1)) {
									if (a > 0) {
										var g = i * s, h = a - g;
										if (h > 0)
											a = g + c.sqrt(h) * 5
									}
									if (a < 0) {
										var g = i * (r - u - s), h = -a - g;
										if (h > 0)
											a = -g - c.sqrt(h) * 5
									}
								}
								if (H - hb < -2)
									jb = 0;
								else if (H - hb > 2)
									jb = -1;
								hb = H;
								H = a;
								sb = G - H / i / (Y || 1);
								if (H && x && !yb) {
									b.Jb(e);
									if (!M)
										z.ce(sb);
									else
										z.ae(sb)
								}
							}
						}
					}
				}
				function bb() {
					qc();
					if (B) {
						B = k;
						b.Q();
						b.K(g, "mousemove", Bb);
						b.K(g, "touchmove", Bb);
						P = H;
						z.hb();
						var a = w.S();
						f.l(i.pe, t(a), a, t(G), G);
						E & 12 && Pb();
						ec(d)
					}
				}
				function jc(c) {
					if (P) {
						b.ig(c);
						var a = b.bc(c);
						while (a && v !== a) {
							a.tagName == "A" && b.Jb(c);
							try {
								a = a.parentNode
							} catch (d) {
								break
							}
						}
					}
				}
				function Jb(a) {
					C[s];
					s = t(a);
					tb = C[s];
					Tb(a);
					return s
				}
				function Dc(a, b) {
					x = 0;
					Jb(a);
					f.l(i.oe, t(a), b)
				}
				function Tb(a, c) {
					wb = a;
					b.f(S, function(b) {
						b.sc(t(a), a, c)
					})
				}
				function sc() {
					var b = i.Jc || 0, a = X;
					if (ob)
						a & 1 && (a &= 1);
					i.Jc |= a;
					return O = a & ~b
				}
				function qc() {
					if (O) {
						i.Jc &= ~X;
						O = 0
					}
				}
				function Xb() {
					var a = b.Hb();
					b.O(a, V);
					b.H(a, "absolute");
					return a
				}
				function t(a) {
					return (a % r + r) % r
				}
				function kc(b, d) {
					if (d)
						if (!D) {
							b = c.min(c.max(b + wb, 0), r - u);
							d = k
						} else if (D & 2) {
							b = t(b + wb);
							d = k
						}
					cb(b, a.jc, d)
				}
				function xb() {
					b.f(S, function(a) {
						a.ic(a.Pb.wg <= F)
					})
				}
				function hc() {
					if (!F) {
						F = 1;
						xb();
						if (!B) {
							E & 12 && ec();
							E & 3 && C[s].Yb()
						}
					}
				}
				function Ec() {
					if (F) {
						F = 0;
						xb();
						B || !(E & 12) || gc()
					}
				}
				function ic() {
					V = {
						qb : K,
						ub : J,
						k : 0,
						i : 0
					};
					b.f(T, function(a) {
						b.O(a, V);
						b.H(a, "absolute");
						b.Nb(a, "hidden");
						b.Z(a)
					});
					b.O(gb, V)
				}
				function ab(b, a) {
					cb(b, a, d)
				}
				function cb(g, f, j) {
					if (Rb && (!B && (F || !(E & 12)) || a.ld)) {
						M = d;
						B = k;
						z.hb();
						if (f == l)
							f = Vb;
						var e = Cb.ob(), b = g;
						if (j) {
							b = e + g;
							if (g > 0)
								b = c.ceil(b);
							else
								b = c.floor(b)
						}
						if (D & 2)
							b = t(b);
						if (!(D & 1))
							b = c.max(0, c.min(b, r - u));
						var i = (b - e) % r;
						b = e + i;
						var h = e == b ? 0 : f * c.abs(i);
						h = c.min(h, f * u * 1.5);
						z.Qb(e, b, h || 1)
					}
				}
				f.kd = function() {
					if (!N) {
						N = d;
						C[s] && C[s].Yb()
					}
				};
				function W() {
					return b.n(y || p)
				}
				function nb() {
					return b.p(y || p)
				}
				f.P = W;
				f.db = nb;
				function Eb(c, d) {
					if (c == l)
						return b.n(p);
					if (!y) {
						var a = b.Hb(g);
						b.ud(a, b.ud(p));
						b.Ab(a, b.Ab(p));
						b.X(a, "block");
						b.H(a, "relative");
						b.G(a, 0);
						b.C(a, 0);
						b.Nb(a, "visible");
						y = b.Hb(g);
						b.H(y, "absolute");
						b.G(y, 0);
						b.C(y, 0);
						b.n(y, b.n(p));
						b.p(y, b.p(p));
						b.vc(y, "0 0");
						b.M(y, a);
						var h = b.yb(p);
						b.M(p, y);
						b.Y(p, "backgroundImage", "");
						b.f(h, function(c) {
							b.M(b.j(c, "noscale") ? p : a, c);
							b.j(c, "autocenter") && Lb.push(c)
						})
					}
					Y = c / (d ? b.p : b.n)(y);
					b.eg(y, Y);
					var f = d ? Y * W() : c, e = d ? c : Y * nb();
					b.n(p, f);
					b.p(p, e);
					b.f(Lb, function(a) {
						var c = b.fc(b.j(a, "autocenter"));
						b.Dd(a, c)
					})
				}
				f.ke = Eb;
				n.call(f);
				f.W = p = b.kb(p);
				var a = b.I({
					ib : 0,
					we : 1,
					kc : 1,
					mc : 0,
					rc : k,
					Ob : 1,
					xb : d,
					ld : d,
					Ec : 1,
					Tc : 3e3,
					Cc : 1,
					jc : 500,
					ed : e.Zc,
					Hc : 20,
					Oc : 0,
					lb : 1,
					Gc : 0,
					Kd : 1,
					ac : 1,
					sd : 1
				}, fc);
				a.xb = a.xb && b.Te();
				if (a.Hd != l)
					a.Tc = a.Hd;
				if (a.Jd != l)
					a.Gc = a.Jd;
				var fb = a.ac & 3, tc = (a.ac & 4) / -4 || 1, mb = a.Ag, I = b
						.I({
							J : q,
							xb : a.xb
						}, a.Id);
				I.mb = I.mb || I.zg;
				var Fb = a.Fd, Z = a.Cd, eb = a.xg, Q = !a.Kd, y, v = b.F(p,
						"slides", Q), gb = b.F(p, "loading", Q) || b.Hb(g), Nb = b
						.F(p, "navigator", Q), dc = b.F(p, "arrowleft", Q), ac = b
						.F(p, "arrowright", Q), Mb = b
						.F(p, "thumbnavigator", Q), pc = b.n(v), nc = b.p(v), V, T = [], uc = b
						.yb(v);
				b.f(uc, function(a) {
					if (a.tagName == "DIV" && !b.j(a, "u"))
						T.push(a);
					else
						b.pd() && b.A(a, (b.A(a) || 0) + 1)
				});
				var s = -1, wb, tb, r = T.length, K = a.Md || pc, J = a.Ad
						|| nc, Wb = a.Oc, zb = K + Wb, Ab = J + Wb, bc = fb & 1 ? zb
						: Ab, u = c.min(a.lb, r), lb, x, O, yb, S = [], Qb, Sb, Ob, cc, Cc, N, E = a.Cc, lc = a.Tc, Vb = a.jc, rb, ib, kb, Rb = u < r, D = Rb ? a.Ob
						: 0, X, P, F = 1, M, B, R, ub = 0, vb = 0, H, hb, jb, Cb, w, U, z, Ub = new oc, Y, Lb = [];
				if (r) {
					if (a.xb)
						Kb = function(a, c, d) {
							b.Db(a, {
								bb : c,
								cb : d
							})
						};
					N = a.rc;
					f.Pb = fc;
					ic();
					b.q(p, "jssor-slider", d);
					b.A(v, b.A(v) || 0);
					b.H(v, "absolute");
					lb = b.vb(v, d);
					b.Bb(lb, v);
					if (mb) {
						cc = mb.yg;
						rb = mb.J;
						ib = u == 1 && r > 1 && rb && (!b.wd() || b.Vc() >= 8)
					}
					kb = ib || u >= r || !(D & 1) ? 0 : a.Gc;
					X = (u > 1 || kb ? fb : -1) & a.sd;
					var Gb = v, C = [], A, L, Db = b.Df(), ob = Db.Cf, G, qb, Ib, sb;
					Db.td
							&& b.Y(Gb, Db.td,
									([ j, "pan-y", "pan-x", "none" ])[X] || "");
					U = new zc;
					if (ib)
						A = new rb(Ub, K, J, mb, ob);
					b.M(lb, U.hc);
					b.Nb(v, "hidden");
					L = Xb();
					b.Y(L, "backgroundColor", "#000");
					b.oc(L, 0);
					b.Bb(L, Gb.firstChild, Gb);
					for (var db = 0; db < T.length; db++) {
						var wc = T[db], yc = new xc(wc, db);
						C.push(yc)
					}
					b.Z(gb);
					Cb = new Ac;
					z = new mc(Cb, U);
					b.a(v, "click", jc, d);
					b.a(p, "mouseout", b.dc(hc, p));
					b.a(p, "mouseover", b.dc(Ec, p));
					if (X) {
						b.a(v, "mousedown", Yb);
						b.a(v, "touchstart", rc);
						b.a(v, "dragstart", Hb);
						b.a(v, "selectstart", Hb);
						b.a(g, "mouseup", bb);
						b.a(g, "touchend", bb);
						b.a(g, "touchcancel", bb);
						b.a(h, "blur", bb)
					}
					E &= ob ? 10 : 5;
					if (Nb && Fb) {
						Qb = new Fb.J(Nb, Fb, W(), nb());
						S.push(Qb)
					}
					if (Z && dc && ac) {
						Z.Ob = D;
						Z.lb = u;
						Sb = new Z.J(dc, ac, Z, W(), nb());
						S.push(Sb)
					}
					if (Mb && eb) {
						eb.mc = a.mc;
						Ob = new eb.J(Mb, eb);
						S.push(Ob)
					}
					b.f(S, function(a) {
						a.pc(r, C, gb);
						a.nb(o.gc, kc)
					});
					b.Y(p, "visibility", "visible");
					Eb(W());
					xb();
					a.kc && b.a(g, "keydown", function(b) {
						if (b.keyCode == 37)
							ab(-a.kc);
						else
							b.keyCode == 39 && ab(a.kc)
					});
					var pb = a.mc;
					if (!(D & 1))
						pb = c.max(0, c.min(pb, r - u));
					z.Qb(pb, pb, 0)
				}
			};
			i.Ee = 21;
			i.qe = 22;
			i.pe = 23;
			i.Ie = 24;
			i.xe = 25;
			i.Be = 26;
			i.Td = 27;
			i.te = 28;
			i.ie = 202;
			i.oe = 203;
			i.Od = 206;
			i.ve = 207;
			i.ue = 208;
			i.Nc = 209;
			var o = {
				gc : 1
			}, r = function(e, C) {
				var f = this;
				n.call(f);
				e = b.kb(e);
				var s, A, z, r, l = 0, a, m, i, w, x, h, g, q, p, B = [], y = [];
				function v(a) {
					a != -1 && y[a].zd(a == l)
				}
				function t(a) {
					f.l(o.gc, a * m)
				}
				f.W = e;
				f.sc = function(a) {
					if (a != r) {
						var d = l, b = c.floor(a / m);
						l = b;
						r = a;
						v(d);
						v(b)
					}
				};
				f.ic = function(a) {
					b.V(e, a)
				};
				var u;
				f.pc = function(D) {
					if (!u) {
						s = c.ceil(D / m);
						l = 0;
						var o = q + w, r = p + x, n = c.ceil(s / i) - 1;
						A = q + o * (!h ? n : i - 1);
						z = p + r * (h ? n : i - 1);
						b.n(e, A);
						b.p(e, z);
						for (var f = 0; f < s; f++) {
							var C = b.Sf();
							b.jg(C, f + 1);
							var k = b.yd(g, "numbertemplate", C, d);
							b.H(k, "absolute");
							var v = f % (n + 1);
							b.C(k, !h ? o * v : f % i * o);
							b.G(k, h ? r * v : c.floor(f / (n + 1)) * r);
							b.M(e, k);
							B[f] = k;
							a.nc & 1 && b.a(k, "click", b.L(j, t, f));
							a.nc
									& 2
									&& b.a(k, "mouseover", b
											.dc(b.L(j, t, f), k));
							y[f] = b.Vb(k)
						}
						u = d
					}
				};
				f.Pb = a = b.I({
					fd : 10,
					gd : 10,
					hd : 1,
					nc : 1
				}, C);
				g = b.F(e, "prototype");
				q = b.n(g);
				p = b.p(g);
				b.Cb(g, e);
				m = a.id || 1;
				i = a.je || 1;
				w = a.fd;
				x = a.gd;
				h = a.hd - 1;
				a.tc == k && b.q(e, "noscale", d);
				a.rb && b.q(e, "autocenter", a.rb)
			}, s = function(a, g, h) {
				var c = this;
				n.call(c);
				var r, q, e, f, i;
				b.n(a);
				b.p(a);
				function l(a) {
					c.l(o.gc, a, d)
				}
				function p(c) {
					b.V(a, c || !h.Ob && e == 0);
					b.V(g, c || !h.Ob && e >= q - h.lb);
					r = c
				}
				c.sc = function(b, a, c) {
					if (c)
						e = a;
					else {
						e = b;
						p(r)
					}
				};
				c.ic = p;
				var m;
				c.pc = function(c) {
					q = c;
					e = 0;
					if (!m) {
						b.a(a, "click", b.L(j, l, -i));
						b.a(g, "click", b.L(j, l, i));
						b.Vb(a);
						b.Vb(g);
						m = d
					}
				};
				c.Pb = f = b.I({
					id : 1
				}, h);
				i = f.id;
				if (f.tc == k) {
					b.q(a, "noscale", d);
					b.q(g, "noscale", d)
				}
				if (f.rb) {
					b.q(a, "autocenter", f.rb);
					b.q(g, "autocenter", f.rb)
				}
			};
			function q(e, d, c) {
				var a = this;
				m.call(a, 0, c);
				a.jd = b.qd;
				a.Qc = 0;
				a.Rc = c
			}
			var t = function(n, g, l) {
				var a = this, o, h = {}, i = g.mb, c = new m(0, 0);
				m.call(a, 0, 0);
				function j(d, c) {
					var a = {};
					b.f(d, function(d, f) {
						var e = h[f];
						if (e) {
							if (b.Pf(d))
								d = j(d, c || f == "e");
							else if (c)
								if (b.Wb(d))
									d = o[d];
							a[e] = d
						}
					});
					return a
				}
				function k(e, c) {
					var a = [], d = b.yb(e);
					b.f(d, function(d) {
						var h = b.j(d, "u") == "caption";
						if (h) {
							var e = b.j(d, "t"), g = i[b.fc(e)] || i[e], f = {
								W : d,
								uc : g
							};
							a.push(f)
						}
						if (c < 5)
							a = a.concat(k(d, c + 1))
					});
					return a
				}
				function r(e, f, a) {
					b.f(f, function(h) {
						var f = b.I(d, {}, j(h)), g = b.wc(f.U);
						delete f.U;
						if (f.i) {
							f.u = f.i;
							g.u = g.i;
							delete f.i
						}
						if (f.k) {
							f.v = f.k;
							g.v = g.k;
							delete f.k
						}
						var k = {
							U : g,
							P : a.qb,
							db : a.ub
						}, i = new m(h.b, h.d, k, e, a, f);
						c.jb(i);
						a = b.Ce(a, f)
					});
					return a
				}
				function q(a) {
					b.f(a, function(d) {
						var a = d.W, f = b.n(a), e = b.p(a), c = {
							i : b.C(a),
							k : b.G(a),
							u : 0,
							v : 0,
							zb : 1,
							sb : b.A(a) || 0,
							ab : 0,
							R : 0,
							T : 0,
							s : 1,
							z : 1,
							bb : 0,
							cb : 0,
							N : 0,
							Lb : 0,
							Kb : 0,
							qb : f,
							ub : e,
							g : {
								k : 0,
								D : f,
								E : e,
								i : 0
							}
						};
						c.Kc = c.i;
						c.Pc = c.k;
						r(a, d.uc, c)
					})
				}
				function t(g, f, h) {
					var e = g.b - f;
					if (e) {
						var b = new m(f, e);
						b.jb(c, d);
						b.Fb(h);
						a.jb(b)
					}
					a.Ud(g.d);
					return e
				}
				function s(f) {
					var d = c.Xb(), e = 0;
					b.f(f, function(c, f) {
						c = b.I({
							d : l
						}, c);
						t(c, d, e);
						d = c.b;
						e += c.d;
						if (!f || c.t == 2) {
							a.Qc = d;
							a.Rc = d + c.d
						}
					})
				}
				a.jd = function() {
					a.B(-1, d)
				};
				o = [ f.xf, f.yf, f.zf, f.Af, f.Bf, f.Ef, f.jf, f.hf, f.gf,
						f.Le, f.Me, f.Ne, f.Oe, f.Pe, f.Qe, f.Re, f.vd, f.Se,
						f.ff, f.We, f.Xe, f.vg, f.sg, f.tg, f.Rf, f.Jf, f.Kf,
						f.cg, f.Mf, f.Nf, f.Of, f.Qf, f.ag, f.Tf, f.Vf, f.Wf,
						f.Xf ];
				var u = {
					k : "y",
					i : "x",
					E : "m",
					D : "t",
					ab : "r",
					R : "rX",
					T : "rY",
					s : "sX",
					z : "sY",
					bb : "tX",
					cb : "tY",
					N : "tZ",
					Lb : "kX",
					Kb : "kY",
					zb : "o",
					U : "e",
					sb : "i",
					g : "c"
				};
				b.f(u, function(b, a) {
					h[b] = a
				});
				q(k(n, 1));
				c.B(-1);
				var p = g.Je || [], e = [].concat(p[b.fc(b.j(n, "b"))] || []);
				e.push({
					b : c.Eb(),
					d : e.length ? 0 : l
				});
				s(e);
				a.B(-1)
			};
			jssor_1_slider_init = function() {
				var g = [ [ {
					b : -1,
					d : 1,
					o : -1
				}, {
					b : 0,
					d : 1e3,
					x : -257,
					y : -5,
					o : 1
				} ], [ {
					b : 480,
					d : 520,
					x : 120,
					y : -270
				} ], [ {
					b : 1e3,
					d : 500,
					y : 250
				}, {
					b : 8e3,
					d : 1e3,
					x : 600
				} ], [ {
					b : -1,
					d : 1,
					o : -1,
					sX : -.6,
					sY : -.6
				}, {
					b : 1500,
					d : 500,
					o : 1,
					r : 360,
					sX : .6,
					sY : .6
				}, {
					b : 8e3,
					d : 1e3,
					y : -150
				} ], [ {
					b : -1,
					d : 1,
					o : -1,
					tZ : -200
				}, {
					b : 2e3,
					d : 1e3,
					o : 1,
					tZ : 200
				}, {
					b : 3e3,
					d : 1e3,
					o : -1,
					tZ : 200
				} ], [ {
					b : -1,
					d : 1,
					o : -1,
					tZ : -200
				}, {
					b : 3e3,
					d : 1e3,
					o : 1,
					tZ : 200
				}, {
					b : 4e3,
					d : 1e3,
					o : -1,
					tZ : 200
				} ], [ {
					b : -1,
					d : 1,
					o : -1,
					tZ : -200
				}, {
					b : 4e3,
					d : 1e3,
					o : 1,
					tZ : 200
				}, {
					b : 5e3,
					d : 1e3,
					o : -1,
					tZ : 200
				} ], [ {
					b : -1,
					d : 1,
					o : -1,
					tZ : -200
				}, {
					b : 5e3,
					d : 1e3,
					o : 1,
					tZ : 200
				}, {
					b : 6e3,
					d : 1e3,
					o : -1,
					tZ : 200
				} ], [ {
					b : -1,
					d : 1,
					o : -1,
					tZ : -200
				}, {
					b : 6e3,
					d : 1e3,
					o : 1,
					tZ : 200
				}, {
					b : 7e3,
					d : 1e3,
					o : -1,
					tZ : 200
				} ], [ {
					b : -1,
					d : 1,
					o : -1,
					tZ : -200
				}, {
					b : 7e3,
					d : 1e3,
					o : 1,
					tZ : 200
				}, {
					b : 8e3,
					d : 1e3,
					o : -1,
					tZ : 200
				} ], [ {
					b : -1,
					d : 1,
					c : {
						x : 250,
						t : -250
					}
				}, {
					b : 0,
					d : 1e3,
					c : {
						x : -250,
						t : 250
					}
				}, {
					b : 5e3,
					d : 1e3,
					y : 100
				} ], [ {
					b : -1,
					d : 1,
					o : -1
				}, {
					b : 1e3,
					d : 1e3,
					o : 1
				}, {
					b : 5e3,
					d : 1e3,
					y : 280
				} ], [ {
					b : 2e3,
					d : 1e3,
					y : 190,
					e : {
						y : 28
					}
				}, {
					b : 5e3,
					d : 1e3,
					x : 280
				} ], [ {
					b : 3e3,
					d : 520,
					y : 50
				}, {
					b : 5e3,
					d : 1e3,
					y : -50
				} ], [ {
					b : 3520,
					d : 480,
					x : -400
				}, {
					b : 5e3,
					d : 800,
					x : 400,
					e : {
						x : 7
					}
				} ], [ {
					b : 4e3,
					d : 500,
					x : -400
				}, {
					b : 5e3,
					d : 800,
					x : 400,
					e : {
						x : 7
					}
				} ], [ {
					b : 4500,
					d : 500,
					x : -400
				}, {
					b : 5e3,
					d : 800,
					x : 400,
					e : {
						x : 7
					}
				} ], [ {
					b : -1,
					d : 1,
					c : {
						x : 250,
						t : -250
					}
				}, {
					b : 0,
					d : 1e3,
					c : {
						x : -250,
						t : 250
					}
				}, {
					b : 1e4,
					d : 500,
					y : 90
				} ], [ {
					b : -1,
					d : 1,
					c : {
						x : 150,
						t : -150
					}
				}, {
					b : 1e3,
					d : 1e3,
					c : {
						x : -150,
						t : 150
					}
				}, {
					b : 1e4,
					d : 500,
					c : {
						y : 150,
						m : -150
					}
				} ], [ {
					b : 2e3,
					d : 500,
					x : 220
				} ], [ {
					b : 3500,
					d : 500,
					rX : -20
				}, {
					b : 4e3,
					d : 1e3,
					rX : 40
				}, {
					b : 5e3,
					d : 500,
					rX : -10
				}, {
					b : 9500,
					d : 500,
					o : -1
				} ], [ {
					b : 3500,
					d : 2e3,
					r : 360
				} ], [ {
					b : -1,
					d : 1,
					o : -1
				}, {
					b : 2500,
					d : 500,
					x : 76,
					y : -25,
					o : 1
				} ], [ {
					b : -1,
					d : 1,
					o : -1
				}, {
					b : 2500,
					d : 500,
					x : 47,
					y : 65,
					o : 1
				} ], [ {
					b : -1,
					d : 1,
					o : -1
				}, {
					b : 2500,
					d : 500,
					x : -47,
					y : 65,
					o : 1
				} ], [ {
					b : -1,
					d : 1,
					o : -1
				}, {
					b : 2500,
					d : 500,
					x : -76,
					y : -25,
					o : 1
				} ], [ {
					b : -1,
					d : 1,
					o : -1
				}, {
					b : 2500,
					d : 500,
					y : -80,
					o : 1
				} ], [ {
					b : -1,
					d : 1,
					c : {
						x : 120,
						t : -120
					}
				}, {
					b : 6100,
					d : 400,
					c : {
						x : -120,
						t : 120
					}
				}, {
					b : 1e4,
					d : 500,
					y : -120
				} ], [ {
					b : 6500,
					d : 500,
					x : 220
				} ], [ {
					b : -1,
					d : 1,
					o : -1,
					r : 180,
					sX : -.5,
					sY : -.5
				}, {
					b : 7e3,
					d : 500,
					o : 1,
					r : 180,
					sX : .5,
					sY : .5
				}, {
					b : 8e3,
					d : 500,
					o : -1,
					r : 180,
					sX : 9,
					sY : 9
				} ], [ {
					b : -1,
					d : 1,
					o : -1,
					r : 180,
					sX : -.5,
					sY : -.5
				}, {
					b : 8e3,
					d : 500,
					o : 1,
					r : 180,
					sX : .5,
					sY : .5
				}, {
					b : 9e3,
					d : 500,
					o : -1,
					r : 180,
					sX : 9,
					sY : 9
				} ], [ {
					b : -1,
					d : 1,
					o : -1,
					r : 180,
					sX : -.5,
					sY : -.5
				}, {
					b : 9e3,
					d : 500,
					o : 1,
					r : 180,
					sX : .5,
					sY : .5
				}, {
					b : 9500,
					d : 500,
					o : -1,
					r : 180,
					sX : 9,
					sY : 9
				} ] ], j = {
					rc : d,
					ed : f.vd,
					Id : {
						J : t,
						mb : g,
						Je : [ [ {
							d : 3e3,
							b : 8e3,
							t : 2
						} ], [ {
							d : 2e3,
							b : 5e3
						} ], [ {
							d : 3e3,
							b : 9500,
							t : 2
						} ] ]
					},
					Cd : {
						J : s
					},
					Fd : {
						J : r
					}
				}, e = new i("jssor_1", j);
				function a() {
					var b = e.W.parentNode.clientWidth;
					if (b) {
						b = c.min(b, 980);
						e.ke(b)
					} else
						h.setTimeout(a, 30)
				}
				a();
				b.a(h, "load", a);
				b.a(h, "resize", a);
				b.a(h, "orientationchange", a)
			}
		})(window, document, Math, null, true, false)