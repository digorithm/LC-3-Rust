.orig x6000
;; JUMP TABLE:
	.fill 	x3076	; COND_222_0_ln_21
	.fill 	x3091	; COND_959_2_ln_28
	.fill 	x30e7	; COND_410_3_ln_28
	.fill 	x3136	; COND_601_5_ln_49
	.fill 	x31b2	; COND_84_6_ln_49
	.fill 	x31b4	; COND_24_4_ln_37
	.fill 	x31b7	; END_COND_24_4_ln_37
	.fill 	x31b9	; COND_179_1_ln_21
	.fill 	x31bb	; F_eval
	.fill 	x31e9	; COND_563_8_ln_80
	.fill 	x322a	; COND_94_11_ln_87
	.fill 	x327d	; COND_375_12_ln_87
	.fill 	x328d	; COND_168_10_ln_81
	.fill 	x32b8	; COND_994_14_ln_98
	.fill 	x32e3	; COND_493_15_ln_102
	.fill 	x330e	; COND_19_16_ln_106
	.fill 	x3314	; END_COND_168_10_ln_81
	.fill 	x331e	; COND_935_9_ln_80
	.fill 	x3324	; COND_574_16_ln_124
	.fill 	x3359	; COND_573_19_ln_133
	.fill 	x33d7	; COND_155_21_ln_143
	.fill 	x33e7	; END_COND_155_21_ln_143
	.fill 	x33e9	; COND_561_20_ln_133
	.fill 	x33f7	; END_COND_850_18_ln_127
	.fill 	x33ff	; COND_118_17_ln_124
;; END OF JUMP TABLE
.end


.orig x6800
;; STR TABLE:
	.stringz 	"Type in an expression with only '+' and '*'.\nMake sure it is valid\n"
	.stringz 	"\n>>\t"
	.stringz 	"\nThe result is: "
;; END OF STR TABLE
.end

.orig x3000
;; CODE:

	brnzp #2 	; The code effectively starts at x3003
STACK		 .fill 	xF000
TABLE		 .fill 	x6000


;; i: 0, j: 0, IR: (None, '__setup_main__')
	ld R6, STACK 	; 0
	add R5, R6, #-1 	; 1
	and R3, R3, #0 	; 2
	ld R4, TABLE 	; 3
	add R6, R6, #-9 	; 4
;; i: 1, j: 5, IR: ([(4, "Type in an expression with only '+' and '*'.\nMake sure it is valid\n"), (3, 'msg')], '__array_assign__')
	add R6, R6, #-16 	; 5
	add R6, R6, #-16 	; 6
	add R6, R6, #-16 	; 7
	add R6, R6, #-16 	; 8
	add R6, R6, #-5 	; 9
	add R2, R3, #8 	; 10
	add R2, R2, R2 	; 11
	add R2, R2, R2 	; 12
	add R2, R2, R2 	; 13
	add R2, R2, #4 	; 14
	str R2, R6, #0 	; 15
	add R0, R5, #0 	; 16
	add R1, R6, #1 	; 17
	str R1, R0, #0 	; 18
	add R0, R3, #15 	; 19
	add R0, R0, #1 	; 20
	add R0, R0, R0 	; 21
	add R0, R0, R0 	; 22
	add R0, R0, R0 	; 23
	add R0, R0, R0 	; 24
	add R0, R0, R0 	; 25
	add R0, R0, R0 	; 26
	add R0, R0, R0 	; 27
	add R0, R0, #0 	; 28
	add R0, R4, R0 	; 29
	ldr R3, R0, #0 	; 30
	str R3, R1, #0 	; 31
	add R0, R0, #1 	; 32
	add R1, R1, #1 	; 33
	add R2, R2, #-1 	; 34
	brp #-6 	; 35
	and R3, R3, #0 	; 36
;; i: 2, j: 37, IR: ([(4, '\n>>\t'), (3, 'prompt')], '__array_assign__')
	add R6, R6, #-6 	; 37
	add R2, R3, #5 	; 38
	str R2, R6, #0 	; 39
	add R0, R5, #-1 	; 40
	add R1, R6, #1 	; 41
	str R1, R0, #0 	; 42
	add R0, R3, #15 	; 43
	add R0, R0, #1 	; 44
	add R0, R0, R0 	; 45
	add R0, R0, R0 	; 46
	add R0, R0, R0 	; 47
	add R0, R0, R0 	; 48
	add R0, R0, R0 	; 49
	add R0, R0, R0 	; 50
	add R0, R0, R0 	; 51
	add R0, R0, #15 	; 52
	add R0, R0, #15 	; 53
	add R0, R0, #15 	; 54
	add R0, R0, #15 	; 55
	add R0, R0, #8 	; 56
	add R0, R4, R0 	; 57
	ldr R3, R0, #0 	; 58
	str R3, R1, #0 	; 59
	add R0, R0, #1 	; 60
	add R1, R1, #1 	; 61
	add R2, R2, #-1 	; 62
	brp #-6 	; 63
	and R3, R3, #0 	; 64
;; i: 3, j: 65, IR: ([(4, '\nThe result is: '), (3, 'output')], '__array_assign__')
	add R6, R6, #-16 	; 65
	add R6, R6, #-2 	; 66
	add R2, R3, #8 	; 67
	add R2, R2, R2 	; 68
	add R2, R2, #1 	; 69
	str R2, R6, #0 	; 70
	add R0, R5, #-2 	; 71
	add R1, R6, #1 	; 72
	str R1, R0, #0 	; 73
	add R0, R3, #15 	; 74
	add R0, R0, #1 	; 75
	add R0, R0, R0 	; 76
	add R0, R0, R0 	; 77
	add R0, R0, R0 	; 78
	add R0, R0, R0 	; 79
	add R0, R0, R0 	; 80
	add R0, R0, R0 	; 81
	add R0, R0, R0 	; 82
	add R0, R0, #15 	; 83
	add R0, R0, #15 	; 84
	add R0, R0, #15 	; 85
	add R0, R0, #15 	; 86
	add R0, R0, #13 	; 87
	add R0, R4, R0 	; 88
	ldr R3, R0, #0 	; 89
	str R3, R1, #0 	; 90
	add R0, R0, #1 	; 91
	add R1, R1, #1 	; 92
	add R2, R2, #-1 	; 93
	brp #-6 	; 94
	and R3, R3, #0 	; 95
;; i: 4, j: 96, IR: ((3, 'msg'), 'print')
	add R2, R0, #0 	; 96
	add R0, R5, #0 	; 97
	ldr R0, R0, #0 	; 98
	puts 	; 99
	add R0, R2, #0 	; 100
;; i: 5, j: 101, IR: ([(0, 92), (3, 'str')], '__array_assign__')
	add R0, R3, #11 	; 101
	add R0, R0, R0 	; 102
	add R0, R0, R0 	; 103
	add R0, R0, R0 	; 104
	add R0, R0, #4 	; 105
	not R1, R0 	; 106
	add R6, R6, R1 	; 107
	str R0, R6, #0 	; 108
	add R0, R5, #-3 	; 109
	add R1, R6, #1 	; 110
	str R1, R0, #0 	; 111
;; i: 6, j: 112, IR: ([(0, 0), (3, 'done')], '=')
	add R0, R3, #0 	; 112
	add R1, R5, #-4 	; 113
	str R0, R1, #0 	; 114
;; i: 7, j: 115, IR: ([(3, 'done')], 'not')
	add R0, R5, #-4 	; 115
	ldr R0, R0, #0 	; 116
	add R0, R0, #0 	; 117
	brz #2 	; 118
	add R0, R3, #0 	; 119
	brnzp #1 	; 120
	add R0, R3, #1 	; 121
;; i: 8, j: 122, IR: ((8, '$'), '__load_cc__')
	add R0, R0, #0 	; 122
;; i: 9, j: 123, IR: ('COND_179_1_ln_21', '__cond_branch__')
	brnp #2 	; 123
	ldr R0, R4, #7 	; 124
	jmp R0 	; 125
;; i: 10, j: 126, IR: ((3, 'prompt'), 'print')
	add R2, R0, #0 	; 126
	add R0, R5, #-1 	; 127
	ldr R0, R0, #0 	; 128
	puts 	; 129
	add R0, R2, #0 	; 130
;; i: 11, j: 131, IR: ([(0, 0), (3, 'i')], '=')
	add R0, R3, #0 	; 131
	add R1, R5, #-5 	; 132
	str R0, R1, #0 	; 133
;; i: 12, j: 134, IR: (None, 'getc')
	getc 	; 134
;; i: 13, j: 135, IR: ([(8, '$'), (3, 'c')], '=')
	add R1, R5, #-6 	; 135
	str R0, R1, #0 	; 136
;; i: 14, j: 137, IR: ((3, 'c'), 'outc')
	add R2, R0, #0 	; 137
	add R0, R5, #-6 	; 138
	ldr R0, R0, #0 	; 139
	out 	; 140
	add R0, R2, #0 	; 141
;; i: 15, j: 142, IR: ([(0, 59), (3, 'c')], '==')
	add R0, R5, #-6 	; 142
	ldr R0, R0, #0 	; 143
	add R1, R3, #14 	; 144
	add R1, R1, R1 	; 145
	add R1, R1, R1 	; 146
	add R1, R1, #3 	; 147
	not R1, R1 	; 148
	add R1, R1, #1 	; 149
	add R0, R0, R1 	; 150
	brnp #2 	; 151
	add R0, R3, #1 	; 152
	brnzp #1 	; 153
	add R0, R3, #0 	; 154
;; i: 16, j: 155, IR: ([(0, 113), (3, 'c')], '==')
	add R6, R6, #-1 	; 155
	str R0, R6, #0 	; 156
	add R0, R5, #-6 	; 157
	ldr R0, R0, #0 	; 158
	add R1, R3, #14 	; 159
	add R1, R1, R1 	; 160
	add R1, R1, R1 	; 161
	add R1, R1, R1 	; 162
	add R1, R1, #1 	; 163
	not R1, R1 	; 164
	add R1, R1, #1 	; 165
	add R0, R0, R1 	; 166
	brnp #2 	; 167
	add R0, R3, #1 	; 168
	brnzp #1 	; 169
	add R0, R3, #0 	; 170
;; i: 17, j: 171, IR: ([(8, '$'), (8, '$')], 'or')
	ldr R1, R6, #0 	; 171
	add R6, R6, #1 	; 172
	add R0, R0, #0 	; 173
	brnp #1 	; 174
	add R0, R1, #0 	; 175
;; i: 18, j: 176, IR: ([(8, '$')], 'not')
	add R0, R0, #0 	; 176
	brz #2 	; 177
	add R0, R3, #0 	; 178
	brnzp #1 	; 179
	add R0, R3, #1 	; 180
;; i: 19, j: 181, IR: ([(0, 90), (3, 'i')], '<')
	add R6, R6, #-1 	; 181
	str R0, R6, #0 	; 182
	add R0, R5, #-5 	; 183
	ldr R0, R0, #0 	; 184
	add R1, R3, #11 	; 185
	add R1, R1, R1 	; 186
	add R1, R1, R1 	; 187
	add R1, R1, R1 	; 188
	add R1, R1, #2 	; 189
	not R1, R1 	; 190
	add R1, R1, #1 	; 191
	add R0, R0, R1 	; 192
	brn #1 	; 193
	add R0, R3, #0 	; 194
;; i: 20, j: 195, IR: ([(8, '$'), (8, '$')], 'and')
	ldr R1, R6, #0 	; 195
	add R6, R6, #1 	; 196
	add R0, R0, #0 	; 197
	brz #1 	; 198
	add R0, R1, #0 	; 199
;; i: 21, j: 200, IR: ((8, '$'), '__load_cc__')
	add R0, R0, #0 	; 200
;; i: 22, j: 201, IR: ('COND_410_3_ln_28', '__cond_branch__')
	brnp #2 	; 201
	ldr R0, R4, #2 	; 202
	jmp R0 	; 203
;; i: 23, j: 204, IR: ([(3, 'i'), (3, 'str')], '+')
	add R0, R5, #-3 	; 204
	ldr R0, R0, #0 	; 205
	add R1, R5, #-5 	; 206
	ldr R1, R1, #0 	; 207
	add R0, R0, R1 	; 208
;; i: 24, j: 209, IR: ([(3, 'c'), (8, '$')], '__mem_assign__')
	add R1, R5, #-6 	; 209
	ldr R1, R1, #0 	; 210
	str R1, R0, #0 	; 211
;; i: 25, j: 212, IR: ([(0, 1), (3, 'i')], '+')
	add R0, R5, #-5 	; 212
	ldr R0, R0, #0 	; 213
	add R1, R3, #1 	; 214
	add R0, R0, R1 	; 215
;; i: 26, j: 216, IR: ([(8, '$'), (3, 'i')], '=')
	add R1, R5, #-5 	; 216
	str R0, R1, #0 	; 217
;; i: 27, j: 218, IR: (None, 'getc')
	getc 	; 218
;; i: 28, j: 219, IR: ([(8, '$'), (3, 'c')], '=')
	add R1, R5, #-6 	; 219
	str R0, R1, #0 	; 220
;; i: 29, j: 221, IR: ((3, 'c'), 'outc')
	add R2, R0, #0 	; 221
	add R0, R5, #-6 	; 222
	ldr R0, R0, #0 	; 223
	out 	; 224
	add R0, R2, #0 	; 225
;; i: 30, j: 226, IR: ('COND_959_2_ln_28', '__branch__')
	ldr R0, R4, #1 	; 226
	jmp R0 	; 227
;; i: 31, j: 228, IR: ((0, 10), 'outc')
	add R2, R0, #0 	; 228
	add R0, R3, #10 	; 229
	out 	; 230
	add R0, R2, #0 	; 231
;; i: 32, j: 232, IR: ([(0, 113), (3, 'c')], '==')
	add R0, R5, #-6 	; 232
	ldr R0, R0, #0 	; 233
	add R1, R3, #14 	; 234
	add R1, R1, R1 	; 235
	add R1, R1, R1 	; 236
	add R1, R1, R1 	; 237
	add R1, R1, #1 	; 238
	not R1, R1 	; 239
	add R1, R1, #1 	; 240
	add R0, R0, R1 	; 241
	brnp #2 	; 242
	add R0, R3, #1 	; 243
	brnzp #1 	; 244
	add R0, R3, #0 	; 245
;; i: 33, j: 246, IR: ([(8, '$')], 'not')
	add R0, R0, #0 	; 246
	brz #2 	; 247
	add R0, R3, #0 	; 248
	brnzp #1 	; 249
	add R0, R3, #1 	; 250
;; i: 34, j: 251, IR: ((8, '$'), '__load_cc__')
	add R0, R0, #0 	; 251
;; i: 35, j: 252, IR: ('COND_24_4_ln_37', '__cond_branch__')
	brnp #2 	; 252
	ldr R0, R4, #5 	; 253
	jmp R0 	; 254
;; i: 36, j: 255, IR: ([(3, 'i'), (3, 'str')], '+')
	add R0, R5, #-3 	; 255
	ldr R0, R0, #0 	; 256
	add R1, R5, #-5 	; 257
	ldr R1, R1, #0 	; 258
	add R0, R0, R1 	; 259
;; i: 37, j: 260, IR: ([(0, 59), (8, '$')], '__mem_assign__')
	add R1, R3, #14 	; 260
	add R1, R1, R1 	; 261
	add R1, R1, R1 	; 262
	add R1, R1, #3 	; 263
	str R1, R0, #0 	; 264
;; i: 38, j: 265, IR: ([(3, 'i'), (3, 'str')], '+')
	add R0, R5, #-3 	; 265
	ldr R0, R0, #0 	; 266
	add R1, R5, #-5 	; 267
	ldr R1, R1, #0 	; 268
	add R0, R0, R1 	; 269
;; i: 39, j: 270, IR: ([(0, 1), (8, '$')], '+')
	add R1, R3, #1 	; 270
	add R0, R0, R1 	; 271
;; i: 40, j: 272, IR: ([(0, 0), (8, '$')], '__mem_assign__')
	add R1, R3, #0 	; 272
	str R1, R0, #0 	; 273
;; i: 41, j: 274, IR: ([(3, 'str')], '__push__')
	add R6, R6, #-1 	; 274
	add R0, R5, #-3 	; 275
	ldr R0, R0, #0 	; 276
	str R0, R6, #0 	; 277
;; i: 42, j: 278, IR: ('F_eval', '__jump_to_routine___')
	ldr R0, R4, #8 	; 278
	jsrr R0 	; 279
;; i: 43, j: 280, IR: ([(3, 'str')], '__fetch_return_value__')
	ldr R0, R6, #0 	; 280
	add R6, R6, #2 	; 281
;; i: 44, j: 282, IR: ([(8, '$'), (3, 'a')], '=')
	add R1, R5, #-7 	; 282
	str R0, R1, #0 	; 283
;; i: 45, j: 284, IR: ((3, 'output'), 'print')
	add R2, R0, #0 	; 284
	add R0, R5, #-2 	; 285
	ldr R0, R0, #0 	; 286
	puts 	; 287
	add R0, R2, #0 	; 288
;; i: 46, j: 289, IR: ([(0, 10000), (3, 'i')], '=')
	add R0, R3, #9 	; 289
	add R0, R0, R0 	; 290
	add R0, R0, R0 	; 291
	add R0, R0, R0 	; 292
	add R0, R0, R0 	; 293
	add R0, R0, #12 	; 294
	add R0, R0, R0 	; 295
	add R0, R0, R0 	; 296
	add R0, R0, R0 	; 297
	add R0, R0, R0 	; 298
	add R0, R0, R0 	; 299
	add R0, R0, #8 	; 300
	add R0, R0, R0 	; 301
	add R1, R5, #-5 	; 302
	str R0, R1, #0 	; 303
;; i: 47, j: 304, IR: ([(0, 0), (3, 'div')], '=')
	add R0, R3, #0 	; 304
	add R1, R5, #-8 	; 305
	str R0, R1, #0 	; 306
;; i: 48, j: 307, IR: ((3, 'i'), '__load_cc__')
	add R0, R5, #-5 	; 307
	ldr R0, R0, #0 	; 308
;; i: 49, j: 309, IR: ('COND_84_6_ln_49', '__cond_branch__')
	brnp #2 	; 309
	ldr R0, R4, #4 	; 310
	jmp R0 	; 311
;; i: 50, j: 312, IR: ([(3, 'i'), (3, 'a')], '/')
	add R0, R5, #-7 	; 312
	ldr R0, R0, #0 	; 313
	add R1, R5, #-5 	; 314
	ldr R1, R1, #0 	; 315
	add R1, R1, #0 	; 316
	brz #34 	; 317
	brn #3 	; 318
	add R0, R0, #0 	; 319
	brn #17 	; 320
	brnzp #6 	; 321
	add R0, R0, #0 	; 322
	brzp #14 	; 323
	not R0, R0 	; 324
	add R0, R0, #1 	; 325
	not R1, R1 	; 326
	add R1, R1, #1 	; 327
	add R2, R3, #0 	; 328
	not R1, R1 	; 329
	add R1, R1, #1 	; 330
	add R0, R0, #0 	; 331
	brn #3 	; 332
	add R2, R2, #1 	; 333
	add R0, R0, R1 	; 334
	brzp #-3 	; 335
	add R0, R2, #-1 	; 336
	brnzp #14 	; 337
	add R1, R1, #0 	; 338
	brn #4 	; 339
	not R0, R0 	; 340
	add R0, R0, #1 	; 341
	not R1, R1 	; 342
	add R1, R1, #1 	; 343
	add R2, R3, #0 	; 344
	add R0, R0, #0 	; 345
	brn #3 	; 346
	add R2, R2, #1 	; 347
	add R0, R0, R1 	; 348
	brzp #-3 	; 349
	not R2, R2 	; 350
	add R0, R2, #2 	; 351
;; i: 51, j: 352, IR: ([(8, '$'), (3, 'div')], '=')
	add R1, R5, #-8 	; 352
	str R0, R1, #0 	; 353
;; i: 52, j: 354, IR: ([(0, 48), (3, 'div')], '+')
	add R0, R5, #-8 	; 354
	ldr R0, R0, #0 	; 355
	add R1, R3, #12 	; 356
	add R1, R1, R1 	; 357
	add R1, R1, R1 	; 358
	add R0, R0, R1 	; 359
;; i: 53, j: 360, IR: ((8, '$'), 'outc')
	add R2, R0, #0 	; 360
	out 	; 361
	add R0, R2, #0 	; 362
;; i: 54, j: 363, IR: (None, '__pop__')
;; i: 55, j: 363, IR: ([(3, 'i'), (3, 'div')], '*')
	add R0, R5, #-8 	; 363
	ldr R0, R0, #0 	; 364
	add R1, R5, #-5 	; 365
	ldr R1, R1, #0 	; 366
	add R1, R1, #0 	; 367
	brzp #4 	; 368
	not R1, R1 	; 369
	add R1, R1, #1 	; 370
	not R0, R0 	; 371
	add R0, R0, #1 	; 372
	and R2, R3, #0 	; 373
	add R1, R1, #0 	; 374
	brnz #3 	; 375
	add R2, R2, R0 	; 376
	add R1, R1, #-1 	; 377
	brp #-3 	; 378
	add R0, R2, #0 	; 379
;; i: 56, j: 380, IR: ([(8, '$'), (3, 'a')], '-')
	add R1, R0, #0 	; 380
	add R0, R5, #-7 	; 381
	ldr R0, R0, #0 	; 382
	not R1, R1 	; 383
	add R1, R1, #1 	; 384
	add R0, R0, R1 	; 385
;; i: 57, j: 386, IR: ([(8, '$'), (3, 'a')], '=')
	add R1, R5, #-7 	; 386
	str R0, R1, #0 	; 387
;; i: 58, j: 388, IR: ([(0, 10), (3, 'i')], '/')
	add R0, R5, #-5 	; 388
	ldr R0, R0, #0 	; 389
	add R1, R3, #10 	; 390
	add R1, R1, #0 	; 391
	brz #34 	; 392
	brn #3 	; 393
	add R0, R0, #0 	; 394
	brn #17 	; 395
	brnzp #6 	; 396
	add R0, R0, #0 	; 397
	brzp #14 	; 398
	not R0, R0 	; 399
	add R0, R0, #1 	; 400
	not R1, R1 	; 401
	add R1, R1, #1 	; 402
	add R2, R3, #0 	; 403
	not R1, R1 	; 404
	add R1, R1, #1 	; 405
	add R0, R0, #0 	; 406
	brn #3 	; 407
	add R2, R2, #1 	; 408
	add R0, R0, R1 	; 409
	brzp #-3 	; 410
	add R0, R2, #-1 	; 411
	brnzp #14 	; 412
	add R1, R1, #0 	; 413
	brn #4 	; 414
	not R0, R0 	; 415
	add R0, R0, #1 	; 416
	not R1, R1 	; 417
	add R1, R1, #1 	; 418
	add R2, R3, #0 	; 419
	add R0, R0, #0 	; 420
	brn #3 	; 421
	add R2, R2, #1 	; 422
	add R0, R0, R1 	; 423
	brzp #-3 	; 424
	not R2, R2 	; 425
	add R0, R2, #2 	; 426
;; i: 59, j: 427, IR: ([(8, '$'), (3, 'i')], '=')
	add R1, R5, #-5 	; 427
	str R0, R1, #0 	; 428
;; i: 60, j: 429, IR: ('COND_601_5_ln_49', '__branch__')
	ldr R0, R4, #3 	; 429
	jmp R0 	; 430
;; i: 61, j: 431, IR: ('END_COND_24_4_ln_37', '__branch__')
	ldr R0, R4, #6 	; 431
	jmp R0 	; 432
;; i: 62, j: 433, IR: ([(0, 1), (3, 'done')], '=')
	add R0, R3, #1 	; 433
	add R1, R5, #-4 	; 434
	str R0, R1, #0 	; 435
;; i: 63, j: 436, IR: ('COND_222_0_ln_21', '__branch__')
	ldr R0, R4, #0 	; 436
	jmp R0 	; 437
;; i: 64, j: 438, IR: (['msg', 'prompt', 'output', 'str', 'done', 'i', 'c', 'a', 'div'], '__clean_main__')
	add R6, R5, #1 	; 438
;; i: 65, j: 439, IR: (None, '__halt__')
	halt 	; 439
;; i: 66, j: 440, IR: (('eval', ['str']), '__setup_func__')
	add R6, R6, #-3 	; 440
	str R5, R6, #0 	; 441
	str R7, R6, #1 	; 442
	add R5, R6, #-1 	; 443
	add R6, R6, #-14 	; 444
;; i: 67, j: 445, IR: ([(0, 10), (3, 'num_stack')], '__array_assign__')
	add R0, R3, #10 	; 445
	not R1, R0 	; 446
	add R6, R6, R1 	; 447
	str R0, R6, #0 	; 448
	add R0, R5, #0 	; 449
	add R1, R6, #1 	; 450
	str R1, R0, #0 	; 451
;; i: 68, j: 452, IR: ([(0, 10), (3, 'op_stack')], '__array_assign__')
	add R0, R3, #10 	; 452
	not R1, R0 	; 453
	add R6, R6, R1 	; 454
	str R0, R6, #0 	; 455
	add R0, R5, #-1 	; 456
	add R1, R6, #1 	; 457
	str R1, R0, #0 	; 458
;; i: 69, j: 459, IR: ([(0, 1)], 'um')
	add R0, R3, #-1 	; 459
;; i: 70, j: 460, IR: ([(8, '$'), (3, 'ntop')], '=')
	add R1, R5, #-2 	; 460
	str R0, R1, #0 	; 461
;; i: 71, j: 462, IR: ([(0, 1)], 'um')
	add R0, R3, #-1 	; 462
;; i: 72, j: 463, IR: ([(8, '$'), (3, 'otop')], '=')
	add R1, R5, #-3 	; 463
	str R0, R1, #0 	; 464
;; i: 73, j: 465, IR: ([(0, 1)], 'um')
	add R0, R3, #-1 	; 465
;; i: 74, j: 466, IR: ([(8, '$'), (3, 'sl')], '=')
	add R1, R5, #-4 	; 466
	str R0, R1, #0 	; 467
;; i: 75, j: 468, IR: ([(0, 15), (3, 'tokens')], '__array_assign__')
	add R0, R3, #15 	; 468
	not R1, R0 	; 469
	add R6, R6, R1 	; 470
	str R0, R6, #0 	; 471
	add R0, R5, #-5 	; 472
	add R1, R6, #1 	; 473
	str R1, R0, #0 	; 474
;; i: 76, j: 475, IR: ([(0, 0), (3, 'i')], '=')
	add R0, R3, #0 	; 475
	add R1, R5, #-6 	; 476
	str R0, R1, #0 	; 477
;; i: 77, j: 478, IR: ([(3, 'i'), (3, 'str')], '+')
	add R0, R5, #4 	; 478
	ldr R0, R0, #0 	; 479
	add R1, R5, #-6 	; 480
	ldr R1, R1, #0 	; 481
	add R0, R0, R1 	; 482
;; i: 78, j: 483, IR: ((8, '$'), 'mem')
	ldr R0, R0, #0 	; 483
;; i: 79, j: 484, IR: ([(8, '$'), (3, 'c')], '=')
	add R1, R5, #-7 	; 484
	str R0, R1, #0 	; 485
;; i: 80, j: 486, IR: ((3, 'c'), '__load_cc__')
	add R0, R5, #-7 	; 486
	ldr R0, R0, #0 	; 487
;; i: 81, j: 488, IR: ('COND_935_9_ln_80', '__cond_branch__')
	brnp #2 	; 488
	ldr R0, R4, #17 	; 489
	jmp R0 	; 490
;; i: 82, j: 491, IR: ([(0, 48), (3, 'c')], '>=')
	add R0, R5, #-7 	; 491
	ldr R0, R0, #0 	; 492
	add R1, R3, #12 	; 493
	add R1, R1, R1 	; 494
	add R1, R1, R1 	; 495
	not R1, R1 	; 496
	add R1, R1, #1 	; 497
	add R0, R0, R1 	; 498
	brzp #2 	; 499
	add R0, R3, #0 	; 500
	brnzp #1 	; 501
	add R0, R3, #1 	; 502
;; i: 83, j: 503, IR: ([(0, 57), (3, 'c')], '<=')
	add R6, R6, #-1 	; 503
	str R0, R6, #0 	; 504
	add R0, R5, #-7 	; 505
	ldr R0, R0, #0 	; 506
	add R1, R3, #14 	; 507
	add R1, R1, R1 	; 508
	add R1, R1, R1 	; 509
	add R1, R1, #1 	; 510
	not R1, R1 	; 511
	add R1, R1, #1 	; 512
	add R0, R0, R1 	; 513
	brnz #2 	; 514
	add R0, R3, #0 	; 515
	brnzp #1 	; 516
	add R0, R3, #1 	; 517
;; i: 84, j: 518, IR: ([(8, '$'), (8, '$')], 'and')
	ldr R1, R6, #0 	; 518
	add R6, R6, #1 	; 519
	add R0, R0, #0 	; 520
	brz #1 	; 521
	add R0, R1, #0 	; 522
;; i: 85, j: 523, IR: ((8, '$'), '__load_cc__')
	add R0, R0, #0 	; 523
;; i: 86, j: 524, IR: ('COND_168_10_ln_81', '__cond_branch__')
	brnp #2 	; 524
	ldr R0, R4, #12 	; 525
	jmp R0 	; 526
;; i: 87, j: 527, IR: ([(0, 48), (3, 'c')], '-')
	add R0, R5, #-7 	; 527
	ldr R0, R0, #0 	; 528
	add R1, R3, #12 	; 529
	add R1, R1, R1 	; 530
	add R1, R1, R1 	; 531
	not R1, R1 	; 532
	add R1, R1, #1 	; 533
	add R0, R0, R1 	; 534
;; i: 88, j: 535, IR: ([(8, '$'), (3, 'num')], '=')
	add R1, R5, #-8 	; 535
	str R0, R1, #0 	; 536
;; i: 89, j: 537, IR: ([(0, 1), (3, 'i')], '+')
	add R0, R5, #-6 	; 537
	ldr R0, R0, #0 	; 538
	add R1, R3, #1 	; 539
	add R0, R0, R1 	; 540
;; i: 90, j: 541, IR: ([(8, '$'), (3, 'i')], '=')
	add R1, R5, #-6 	; 541
	str R0, R1, #0 	; 542
;; i: 91, j: 543, IR: ([(3, 'i'), (3, 'str')], '+')
	add R0, R5, #4 	; 543
	ldr R0, R0, #0 	; 544
	add R1, R5, #-6 	; 545
	ldr R1, R1, #0 	; 546
	add R0, R0, R1 	; 547
;; i: 92, j: 548, IR: ((8, '$'), 'mem')
	ldr R0, R0, #0 	; 548
;; i: 93, j: 549, IR: ([(8, '$'), (3, 'c')], '=')
	add R1, R5, #-7 	; 549
	str R0, R1, #0 	; 550
;; i: 94, j: 551, IR: ([(0, 48), (3, 'c')], '>=')
	add R0, R5, #-7 	; 551
	ldr R0, R0, #0 	; 552
	add R1, R3, #12 	; 553
	add R1, R1, R1 	; 554
	add R1, R1, R1 	; 555
	not R1, R1 	; 556
	add R1, R1, #1 	; 557
	add R0, R0, R1 	; 558
	brzp #2 	; 559
	add R0, R3, #0 	; 560
	brnzp #1 	; 561
	add R0, R3, #1 	; 562
;; i: 95, j: 563, IR: ([(0, 57), (3, 'c')], '<=')
	add R6, R6, #-1 	; 563
	str R0, R6, #0 	; 564
	add R0, R5, #-7 	; 565
	ldr R0, R0, #0 	; 566
	add R1, R3, #14 	; 567
	add R1, R1, R1 	; 568
	add R1, R1, R1 	; 569
	add R1, R1, #1 	; 570
	not R1, R1 	; 571
	add R1, R1, #1 	; 572
	add R0, R0, R1 	; 573
	brnz #2 	; 574
	add R0, R3, #0 	; 575
	brnzp #1 	; 576
	add R0, R3, #1 	; 577
;; i: 96, j: 578, IR: ([(8, '$'), (8, '$')], 'and')
	ldr R1, R6, #0 	; 578
	add R6, R6, #1 	; 579
	add R0, R0, #0 	; 580
	brz #1 	; 581
	add R0, R1, #0 	; 582
;; i: 97, j: 583, IR: ((8, '$'), '__load_cc__')
	add R0, R0, #0 	; 583
;; i: 98, j: 584, IR: ('COND_375_12_ln_87', '__cond_branch__')
	brnp #2 	; 584
	ldr R0, R4, #11 	; 585
	jmp R0 	; 586
;; i: 99, j: 587, IR: ([(0, 10), (3, 'num')], '*')
	add R0, R5, #-8 	; 587
	ldr R0, R0, #0 	; 588
	add R1, R3, #10 	; 589
	add R1, R1, #0 	; 590
	brzp #4 	; 591
	not R1, R1 	; 592
	add R1, R1, #1 	; 593
	not R0, R0 	; 594
	add R0, R0, #1 	; 595
	and R2, R3, #0 	; 596
	add R1, R1, #0 	; 597
	brnz #3 	; 598
	add R2, R2, R0 	; 599
	add R1, R1, #-1 	; 600
	brp #-3 	; 601
	add R0, R2, #0 	; 602
;; i: 100, j: 603, IR: ([(0, 48), (3, 'c')], '-')
	add R6, R6, #-1 	; 603
	str R0, R6, #0 	; 604
	add R0, R5, #-7 	; 605
	ldr R0, R0, #0 	; 606
	add R1, R3, #12 	; 607
	add R1, R1, R1 	; 608
	add R1, R1, R1 	; 609
	not R1, R1 	; 610
	add R1, R1, #1 	; 611
	add R0, R0, R1 	; 612
;; i: 101, j: 613, IR: ([(8, '$'), (8, '$')], '+')
	ldr R1, R6, #0 	; 613
	add R6, R6, #1 	; 614
	add R0, R0, R1 	; 615
;; i: 102, j: 616, IR: ([(8, '$'), (3, 'num')], '=')
	add R1, R5, #-8 	; 616
	str R0, R1, #0 	; 617
;; i: 103, j: 618, IR: ([(0, 1), (3, 'i')], '+')
	add R0, R5, #-6 	; 618
	ldr R0, R0, #0 	; 619
	add R1, R3, #1 	; 620
	add R0, R0, R1 	; 621
;; i: 104, j: 622, IR: ([(8, '$'), (3, 'i')], '=')
	add R1, R5, #-6 	; 622
	str R0, R1, #0 	; 623
;; i: 105, j: 624, IR: ([(3, 'i'), (3, 'str')], '+')
	add R0, R5, #4 	; 624
	ldr R0, R0, #0 	; 625
	add R1, R5, #-6 	; 626
	ldr R1, R1, #0 	; 627
	add R0, R0, R1 	; 628
;; i: 106, j: 629, IR: ((8, '$'), 'mem')
	ldr R0, R0, #0 	; 629
;; i: 107, j: 630, IR: ([(8, '$'), (3, 'c')], '=')
	add R1, R5, #-7 	; 630
	str R0, R1, #0 	; 631
;; i: 108, j: 632, IR: ('COND_94_11_ln_87', '__branch__')
	ldr R0, R4, #10 	; 632
	jmp R0 	; 633
;; i: 109, j: 634, IR: ([(0, 1), (3, 'sl')], '+')
	add R0, R5, #-4 	; 634
	ldr R0, R0, #0 	; 635
	add R1, R3, #1 	; 636
	add R0, R0, R1 	; 637
;; i: 110, j: 638, IR: ([(8, '$'), (3, 'sl')], '=')
	add R1, R5, #-4 	; 638
	str R0, R1, #0 	; 639
;; i: 111, j: 640, IR: ([(3, 'sl'), (3, 'tokens')], '+')
	add R0, R5, #-5 	; 640
	ldr R0, R0, #0 	; 641
	add R1, R5, #-4 	; 642
	ldr R1, R1, #0 	; 643
	add R0, R0, R1 	; 644
;; i: 112, j: 645, IR: ([(3, 'num'), (8, '$')], '__mem_assign__')
	add R1, R5, #-8 	; 645
	ldr R1, R1, #0 	; 646
	str R1, R0, #0 	; 647
;; i: 113, j: 648, IR: ('END_COND_168_10_ln_81', '__branch__')
	ldr R0, R4, #16 	; 648
	jmp R0 	; 649
;; i: 114, j: 650, IR: ([(0, 43), (3, 'c')], '==')
	add R0, R5, #-7 	; 650
	ldr R0, R0, #0 	; 651
	add R1, R3, #10 	; 652
	add R1, R1, R1 	; 653
	add R1, R1, R1 	; 654
	add R1, R1, #3 	; 655
	not R1, R1 	; 656
	add R1, R1, #1 	; 657
	add R0, R0, R1 	; 658
	brnp #2 	; 659
	add R0, R3, #1 	; 660
	brnzp #1 	; 661
	add R0, R3, #0 	; 662
;; i: 115, j: 663, IR: ((8, '$'), '__load_cc__')
	add R0, R0, #0 	; 663
;; i: 116, j: 664, IR: ('COND_994_14_ln_98', '__cond_branch__')
	brnp #2 	; 664
	ldr R0, R4, #13 	; 665
	jmp R0 	; 666
;; i: 117, j: 667, IR: ([(0, 1), (3, 'sl')], '+')
	add R0, R5, #-4 	; 667
	ldr R0, R0, #0 	; 668
	add R1, R3, #1 	; 669
	add R0, R0, R1 	; 670
;; i: 118, j: 671, IR: ([(8, '$'), (3, 'sl')], '=')
	add R1, R5, #-4 	; 671
	str R0, R1, #0 	; 672
;; i: 119, j: 673, IR: ([(3, 'sl'), (3, 'tokens')], '+')
	add R0, R5, #-5 	; 673
	ldr R0, R0, #0 	; 674
	add R1, R5, #-4 	; 675
	ldr R1, R1, #0 	; 676
	add R0, R0, R1 	; 677
;; i: 120, j: 678, IR: ([(0, 2)], 'um')
	add R6, R6, #-1 	; 678
	str R0, R6, #0 	; 679
	add R0, R3, #-2 	; 680
;; i: 121, j: 681, IR: ([(8, '$'), (8, '$')], '__mem_assign__')
	add R1, R0, #0 	; 681
	ldr R0, R6, #0 	; 682
	add R6, R6, #1 	; 683
	str R1, R0, #0 	; 684
;; i: 122, j: 685, IR: ([(0, 1), (3, 'i')], '+')
	add R0, R5, #-6 	; 685
	ldr R0, R0, #0 	; 686
	add R1, R3, #1 	; 687
	add R0, R0, R1 	; 688
;; i: 123, j: 689, IR: ([(8, '$'), (3, 'i')], '=')
	add R1, R5, #-6 	; 689
	str R0, R1, #0 	; 690
;; i: 124, j: 691, IR: ('END_COND_168_10_ln_81', '__branch__')
	ldr R0, R4, #16 	; 691
	jmp R0 	; 692
;; i: 125, j: 693, IR: ([(0, 42), (3, 'c')], '==')
	add R0, R5, #-7 	; 693
	ldr R0, R0, #0 	; 694
	add R1, R3, #10 	; 695
	add R1, R1, R1 	; 696
	add R1, R1, R1 	; 697
	add R1, R1, #2 	; 698
	not R1, R1 	; 699
	add R1, R1, #1 	; 700
	add R0, R0, R1 	; 701
	brnp #2 	; 702
	add R0, R3, #1 	; 703
	brnzp #1 	; 704
	add R0, R3, #0 	; 705
;; i: 126, j: 706, IR: ((8, '$'), '__load_cc__')
	add R0, R0, #0 	; 706
;; i: 127, j: 707, IR: ('COND_493_15_ln_102', '__cond_branch__')
	brnp #2 	; 707
	ldr R0, R4, #14 	; 708
	jmp R0 	; 709
;; i: 128, j: 710, IR: ([(0, 1), (3, 'sl')], '+')
	add R0, R5, #-4 	; 710
	ldr R0, R0, #0 	; 711
	add R1, R3, #1 	; 712
	add R0, R0, R1 	; 713
;; i: 129, j: 714, IR: ([(8, '$'), (3, 'sl')], '=')
	add R1, R5, #-4 	; 714
	str R0, R1, #0 	; 715
;; i: 130, j: 716, IR: ([(3, 'sl'), (3, 'tokens')], '+')
	add R0, R5, #-5 	; 716
	ldr R0, R0, #0 	; 717
	add R1, R5, #-4 	; 718
	ldr R1, R1, #0 	; 719
	add R0, R0, R1 	; 720
;; i: 131, j: 721, IR: ([(0, 1)], 'um')
	add R6, R6, #-1 	; 721
	str R0, R6, #0 	; 722
	add R0, R3, #-1 	; 723
;; i: 132, j: 724, IR: ([(8, '$'), (8, '$')], '__mem_assign__')
	add R1, R0, #0 	; 724
	ldr R0, R6, #0 	; 725
	add R6, R6, #1 	; 726
	str R1, R0, #0 	; 727
;; i: 133, j: 728, IR: ([(0, 1), (3, 'i')], '+')
	add R0, R5, #-6 	; 728
	ldr R0, R0, #0 	; 729
	add R1, R3, #1 	; 730
	add R0, R0, R1 	; 731
;; i: 134, j: 732, IR: ([(8, '$'), (3, 'i')], '=')
	add R1, R5, #-6 	; 732
	str R0, R1, #0 	; 733
;; i: 135, j: 734, IR: ('END_COND_168_10_ln_81', '__branch__')
	ldr R0, R4, #16 	; 734
	jmp R0 	; 735
;; i: 136, j: 736, IR: ([(0, 59), (3, 'c')], '==')
	add R0, R5, #-7 	; 736
	ldr R0, R0, #0 	; 737
	add R1, R3, #14 	; 738
	add R1, R1, R1 	; 739
	add R1, R1, R1 	; 740
	add R1, R1, #3 	; 741
	not R1, R1 	; 742
	add R1, R1, #1 	; 743
	add R0, R0, R1 	; 744
	brnp #2 	; 745
	add R0, R3, #1 	; 746
	brnzp #1 	; 747
	add R0, R3, #0 	; 748
;; i: 137, j: 749, IR: ((8, '$'), '__load_cc__')
	add R0, R0, #0 	; 749
;; i: 138, j: 750, IR: ('COND_19_16_ln_106', '__cond_branch__')
	brnp #2 	; 750
	ldr R0, R4, #15 	; 751
	jmp R0 	; 752
;; i: 139, j: 753, IR: ([(0, 1), (3, 'sl')], '+')
	add R0, R5, #-4 	; 753
	ldr R0, R0, #0 	; 754
	add R1, R3, #1 	; 755
	add R0, R0, R1 	; 756
;; i: 140, j: 757, IR: ([(8, '$'), (3, 'sl')], '=')
	add R1, R5, #-4 	; 757
	str R0, R1, #0 	; 758
;; i: 141, j: 759, IR: ([(3, 'sl'), (3, 'tokens')], '+')
	add R0, R5, #-5 	; 759
	ldr R0, R0, #0 	; 760
	add R1, R5, #-4 	; 761
	ldr R1, R1, #0 	; 762
	add R0, R0, R1 	; 763
;; i: 142, j: 764, IR: ([(0, 3)], 'um')
	add R6, R6, #-1 	; 764
	str R0, R6, #0 	; 765
	add R0, R3, #-3 	; 766
;; i: 143, j: 767, IR: ([(8, '$'), (8, '$')], '__mem_assign__')
	add R1, R0, #0 	; 767
	ldr R0, R6, #0 	; 768
	add R6, R6, #1 	; 769
	str R1, R0, #0 	; 770
;; i: 144, j: 771, IR: ([(0, 1), (3, 'i')], '+')
	add R0, R5, #-6 	; 771
	ldr R0, R0, #0 	; 772
	add R1, R3, #1 	; 773
	add R0, R0, R1 	; 774
;; i: 145, j: 775, IR: ([(8, '$'), (3, 'i')], '=')
	add R1, R5, #-6 	; 775
	str R0, R1, #0 	; 776
;; i: 146, j: 777, IR: ('END_COND_168_10_ln_81', '__branch__')
	ldr R0, R4, #16 	; 777
	jmp R0 	; 778
;; i: 147, j: 779, IR: ([(0, 1), (3, 'i')], '+')
	add R0, R5, #-6 	; 779
	ldr R0, R0, #0 	; 780
	add R1, R3, #1 	; 781
	add R0, R0, R1 	; 782
;; i: 148, j: 783, IR: ([(8, '$'), (3, 'i')], '=')
	add R1, R5, #-6 	; 783
	str R0, R1, #0 	; 784
;; i: 149, j: 785, IR: ([(3, 'i'), (3, 'str')], '+')
	add R0, R5, #4 	; 785
	ldr R0, R0, #0 	; 786
	add R1, R5, #-6 	; 787
	ldr R1, R1, #0 	; 788
	add R0, R0, R1 	; 789
;; i: 150, j: 790, IR: ((8, '$'), 'mem')
	ldr R0, R0, #0 	; 790
;; i: 151, j: 791, IR: ([(8, '$'), (3, 'c')], '=')
	add R1, R5, #-7 	; 791
	str R0, R1, #0 	; 792
;; i: 152, j: 793, IR: ('COND_563_8_ln_80', '__branch__')
	ldr R0, R4, #9 	; 793
	jmp R0 	; 794
;; i: 153, j: 795, IR: ([(0, 0), (3, 'i')], '=')
	add R0, R3, #0 	; 795
	add R1, R5, #-6 	; 796
	str R0, R1, #0 	; 797
;; i: 154, j: 798, IR: ([(0, 0), (3, 'res')], '=')
	add R0, R3, #0 	; 798
	add R1, R5, #-9 	; 799
	str R0, R1, #0 	; 800
;; i: 155, j: 801, IR: ([(3, 'sl'), (3, 'i')], '<=')
	add R0, R5, #-6 	; 801
	ldr R0, R0, #0 	; 802
	add R1, R5, #-4 	; 803
	ldr R1, R1, #0 	; 804
	not R1, R1 	; 805
	add R1, R1, #1 	; 806
	add R0, R0, R1 	; 807
	brnz #2 	; 808
	add R0, R3, #0 	; 809
	brnzp #1 	; 810
	add R0, R3, #1 	; 811
;; i: 156, j: 812, IR: ((8, '$'), '__load_cc__')
	add R0, R0, #0 	; 812
;; i: 157, j: 813, IR: ('COND_118_17_ln_124', '__cond_branch__')
	brnp #2 	; 813
	ldr R0, R4, #24 	; 814
	jmp R0 	; 815
;; i: 158, j: 816, IR: ([(3, 'i'), (3, 'tokens')], '+')
	add R0, R5, #-5 	; 816
	ldr R0, R0, #0 	; 817
	add R1, R5, #-6 	; 818
	ldr R1, R1, #0 	; 819
	add R0, R0, R1 	; 820
;; i: 159, j: 821, IR: ((8, '$'), 'mem')
	ldr R0, R0, #0 	; 821
;; i: 160, j: 822, IR: ([(8, '$'), (3, 'curr')], '=')
	add R1, R5, #-10 	; 822
	str R0, R1, #0 	; 823
;; i: 161, j: 824, IR: ([(0, 0), (3, 'curr')], '>=')
	add R0, R5, #-10 	; 824
	ldr R0, R0, #0 	; 825
	add R1, R3, #0 	; 826
	not R1, R1 	; 827
	add R1, R1, #1 	; 828
	add R0, R0, R1 	; 829
	brzp #2 	; 830
	add R0, R3, #0 	; 831
	brnzp #1 	; 832
	add R0, R3, #1 	; 833
;; i: 162, j: 834, IR: ((8, '$'), '__load_cc__')
	add R0, R0, #0 	; 834
;; i: 163, j: 835, IR: ('COND_850_18_ln_127', '__cond_branch__')
	brnp #2 	; 835
	ldr R0, R4, #19 	; 836
	jmp R0 	; 837
;; i: 164, j: 838, IR: ([(0, 1), (3, 'ntop')], '+')
	add R0, R5, #-2 	; 838
	ldr R0, R0, #0 	; 839
	add R1, R3, #1 	; 840
	add R0, R0, R1 	; 841
;; i: 165, j: 842, IR: ([(8, '$'), (3, 'ntop')], '=')
	add R1, R5, #-2 	; 842
	str R0, R1, #0 	; 843
;; i: 166, j: 844, IR: ([(3, 'ntop'), (3, 'num_stack')], '+')
	add R0, R5, #0 	; 844
	ldr R0, R0, #0 	; 845
	add R1, R5, #-2 	; 846
	ldr R1, R1, #0 	; 847
	add R0, R0, R1 	; 848
;; i: 167, j: 849, IR: ([(3, 'curr'), (8, '$')], '__mem_assign__')
	add R1, R5, #-10 	; 849
	ldr R1, R1, #0 	; 850
	str R1, R0, #0 	; 851
;; i: 168, j: 852, IR: ('END_COND_850_18_ln_127', '__branch__')
	ldr R0, R4, #23 	; 852
	jmp R0 	; 853
;; i: 169, j: 854, IR: ([(0, 0), (3, 'otop')], '>=')
	add R0, R5, #-3 	; 854
	ldr R0, R0, #0 	; 855
	add R1, R3, #0 	; 856
	not R1, R1 	; 857
	add R1, R1, #1 	; 858
	add R0, R0, R1 	; 859
	brzp #2 	; 860
	add R0, R3, #0 	; 861
	brnzp #1 	; 862
	add R0, R3, #1 	; 863
;; i: 170, j: 864, IR: ([(3, 'otop'), (3, 'op_stack')], '+')
	add R6, R6, #-1 	; 864
	str R0, R6, #0 	; 865
	add R0, R5, #-1 	; 866
	ldr R0, R0, #0 	; 867
	add R1, R5, #-3 	; 868
	ldr R1, R1, #0 	; 869
	add R0, R0, R1 	; 870
;; i: 171, j: 871, IR: ((8, '$'), 'mem')
	ldr R0, R0, #0 	; 871
;; i: 172, j: 872, IR: ([(8, '$'), (3, 'curr')], '<=')
	add R1, R0, #0 	; 872
	add R0, R5, #-10 	; 873
	ldr R0, R0, #0 	; 874
	not R1, R1 	; 875
	add R1, R1, #1 	; 876
	add R0, R0, R1 	; 877
	brnz #2 	; 878
	add R0, R3, #0 	; 879
	brnzp #1 	; 880
	add R0, R3, #1 	; 881
;; i: 173, j: 882, IR: ([(8, '$'), (8, '$')], 'and')
	ldr R1, R6, #0 	; 882
	add R6, R6, #1 	; 883
	add R0, R0, #0 	; 884
	brz #1 	; 885
	add R0, R1, #0 	; 886
;; i: 174, j: 887, IR: ((8, '$'), '__load_cc__')
	add R0, R0, #0 	; 887
;; i: 175, j: 888, IR: ('COND_561_20_ln_133', '__cond_branch__')
	brnp #2 	; 888
	ldr R0, R4, #22 	; 889
	jmp R0 	; 890
;; i: 176, j: 891, IR: ([(3, 'otop'), (3, 'op_stack')], '+')
	add R0, R5, #-1 	; 891
	ldr R0, R0, #0 	; 892
	add R1, R5, #-3 	; 893
	ldr R1, R1, #0 	; 894
	add R0, R0, R1 	; 895
;; i: 177, j: 896, IR: ((8, '$'), 'mem')
	ldr R0, R0, #0 	; 896
;; i: 178, j: 897, IR: ([(8, '$'), (3, 'operation')], '=')
	add R1, R5, #-11 	; 897
	str R0, R1, #0 	; 898
;; i: 179, j: 899, IR: ([(0, 1), (3, 'otop')], '-')
	add R0, R5, #-3 	; 899
	ldr R0, R0, #0 	; 900
	add R1, R3, #1 	; 901
	not R1, R1 	; 902
	add R1, R1, #1 	; 903
	add R0, R0, R1 	; 904
;; i: 180, j: 905, IR: ([(8, '$'), (3, 'otop')], '=')
	add R1, R5, #-3 	; 905
	str R0, R1, #0 	; 906
;; i: 181, j: 907, IR: ([(3, 'ntop'), (3, 'num_stack')], '+')
	add R0, R5, #0 	; 907
	ldr R0, R0, #0 	; 908
	add R1, R5, #-2 	; 909
	ldr R1, R1, #0 	; 910
	add R0, R0, R1 	; 911
;; i: 182, j: 912, IR: ((8, '$'), 'mem')
	ldr R0, R0, #0 	; 912
;; i: 183, j: 913, IR: ([(8, '$'), (3, 'num1')], '=')
	add R1, R5, #-12 	; 913
	str R0, R1, #0 	; 914
;; i: 184, j: 915, IR: ([(3, 'ntop'), (3, 'num_stack')], '+')
	add R0, R5, #0 	; 915
	ldr R0, R0, #0 	; 916
	add R1, R5, #-2 	; 917
	ldr R1, R1, #0 	; 918
	add R0, R0, R1 	; 919
;; i: 185, j: 920, IR: ([(0, 1), (8, '$')], '-')
	add R1, R3, #1 	; 920
	not R1, R1 	; 921
	add R1, R1, #1 	; 922
	add R0, R0, R1 	; 923
;; i: 186, j: 924, IR: ((8, '$'), 'mem')
	ldr R0, R0, #0 	; 924
;; i: 187, j: 925, IR: ([(8, '$'), (3, 'num2')], '=')
	add R1, R5, #-13 	; 925
	str R0, R1, #0 	; 926
;; i: 188, j: 927, IR: ([(0, 1), (3, 'ntop')], '-')
	add R0, R5, #-2 	; 927
	ldr R0, R0, #0 	; 928
	add R1, R3, #1 	; 929
	not R1, R1 	; 930
	add R1, R1, #1 	; 931
	add R0, R0, R1 	; 932
;; i: 189, j: 933, IR: ([(8, '$'), (3, 'ntop')], '=')
	add R1, R5, #-2 	; 933
	str R0, R1, #0 	; 934
;; i: 190, j: 935, IR: ([(0, 1)], 'um')
	add R0, R3, #-1 	; 935
;; i: 191, j: 936, IR: ([(8, '$'), (3, 'operation')], '==')
	add R1, R0, #0 	; 936
	add R0, R5, #-11 	; 937
	ldr R0, R0, #0 	; 938
	not R1, R1 	; 939
	add R1, R1, #1 	; 940
	add R0, R0, R1 	; 941
	brnp #2 	; 942
	add R0, R3, #1 	; 943
	brnzp #1 	; 944
	add R0, R3, #0 	; 945
;; i: 192, j: 946, IR: ((8, '$'), '__load_cc__')
	add R0, R0, #0 	; 946
;; i: 193, j: 947, IR: ('COND_155_21_ln_143', '__cond_branch__')
	brnp #2 	; 947
	ldr R0, R4, #20 	; 948
	jmp R0 	; 949
;; i: 194, j: 950, IR: ([(3, 'ntop'), (3, 'num_stack')], '+')
	add R0, R5, #0 	; 950
	ldr R0, R0, #0 	; 951
	add R1, R5, #-2 	; 952
	ldr R1, R1, #0 	; 953
	add R0, R0, R1 	; 954
;; i: 195, j: 955, IR: ([(3, 'num2'), (3, 'num1')], '*')
	add R6, R6, #-1 	; 955
	str R0, R6, #0 	; 956
	add R0, R5, #-12 	; 957
	ldr R0, R0, #0 	; 958
	add R1, R5, #-13 	; 959
	ldr R1, R1, #0 	; 960
	add R1, R1, #0 	; 961
	brzp #4 	; 962
	not R1, R1 	; 963
	add R1, R1, #1 	; 964
	not R0, R0 	; 965
	add R0, R0, #1 	; 966
	and R2, R3, #0 	; 967
	add R1, R1, #0 	; 968
	brnz #3 	; 969
	add R2, R2, R0 	; 970
	add R1, R1, #-1 	; 971
	brp #-3 	; 972
	add R0, R2, #0 	; 973
;; i: 196, j: 974, IR: ([(8, '$'), (8, '$')], '__mem_assign__')
	add R1, R0, #0 	; 974
	ldr R0, R6, #0 	; 975
	add R6, R6, #1 	; 976
	str R1, R0, #0 	; 977
;; i: 197, j: 978, IR: ('END_COND_155_21_ln_143', '__branch__')
	ldr R0, R4, #21 	; 978
	jmp R0 	; 979
;; i: 198, j: 980, IR: ([(3, 'ntop'), (3, 'num_stack')], '+')
	add R0, R5, #0 	; 980
	ldr R0, R0, #0 	; 981
	add R1, R5, #-2 	; 982
	ldr R1, R1, #0 	; 983
	add R0, R0, R1 	; 984
;; i: 199, j: 985, IR: ([(3, 'num2'), (3, 'num1')], '+')
	add R6, R6, #-1 	; 985
	str R0, R6, #0 	; 986
	add R0, R5, #-12 	; 987
	ldr R0, R0, #0 	; 988
	add R1, R5, #-13 	; 989
	ldr R1, R1, #0 	; 990
	add R0, R0, R1 	; 991
;; i: 200, j: 992, IR: ([(8, '$'), (8, '$')], '__mem_assign__')
	add R1, R0, #0 	; 992
	ldr R0, R6, #0 	; 993
	add R6, R6, #1 	; 994
	str R1, R0, #0 	; 995
;; i: 201, j: 996, IR: ('COND_573_19_ln_133', '__branch__')
	ldr R0, R4, #19 	; 996
	jmp R0 	; 997
;; i: 202, j: 998, IR: ([(0, 1), (3, 'otop')], '+')
	add R0, R5, #-3 	; 998
	ldr R0, R0, #0 	; 999
	add R1, R3, #1 	; 1000
	add R0, R0, R1 	; 1001
;; i: 203, j: 1002, IR: ([(8, '$'), (3, 'otop')], '=')
	add R1, R5, #-3 	; 1002
	str R0, R1, #0 	; 1003
;; i: 204, j: 1004, IR: ([(3, 'otop'), (3, 'op_stack')], '+')
	add R0, R5, #-1 	; 1004
	ldr R0, R0, #0 	; 1005
	add R1, R5, #-3 	; 1006
	ldr R1, R1, #0 	; 1007
	add R0, R0, R1 	; 1008
;; i: 205, j: 1009, IR: ([(3, 'curr'), (8, '$')], '__mem_assign__')
	add R1, R5, #-10 	; 1009
	ldr R1, R1, #0 	; 1010
	str R1, R0, #0 	; 1011
;; i: 206, j: 1012, IR: ([(0, 1), (3, 'i')], '+')
	add R0, R5, #-6 	; 1012
	ldr R0, R0, #0 	; 1013
	add R1, R3, #1 	; 1014
	add R0, R0, R1 	; 1015
;; i: 207, j: 1016, IR: ([(8, '$'), (3, 'i')], '=')
	add R1, R5, #-6 	; 1016
	str R0, R1, #0 	; 1017
;; i: 208, j: 1018, IR: ('COND_574_16_ln_124', '__branch__')
	ldr R0, R4, #18 	; 1018
	jmp R0 	; 1019
;; i: 209, j: 1020, IR: ([(3, 'ntop'), (3, 'num_stack')], '+')
	add R0, R5, #0 	; 1020
	ldr R0, R0, #0 	; 1021
	add R1, R5, #-2 	; 1022
	ldr R1, R1, #0 	; 1023
	add R0, R0, R1 	; 1024
;; i: 210, j: 1025, IR: ((8, '$'), 'mem')
	ldr R0, R0, #0 	; 1025
;; i: 211, j: 1026, IR: ([(8, '$')], 'return')
	str R0, R5, #3 	; 1026
	add R6, R5, #1 	; 1027
	ldr R5, R6, #0 	; 1028
	ldr R7, R6, #1 	; 1029
	add R6, R6, #2 	; 1030
	ret 	; 1031
;; i: 212, j: 1032, IR: (None, '__return_to_caller__')
	add R6, R5, #1 	; 1032
	ldr R5, R6, #0 	; 1033
	ldr R7, R6, #1 	; 1034
	add R6, R6, #2 	; 1035
	ret 	; 1036

.end