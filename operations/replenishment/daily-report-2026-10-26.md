# 执行日报 2026-10-26

<!-- store-promotion-daily:2026-10-26 -->

统计区间：**北京时间2026-10-25 10:00（含）至2026-10-26 10:00（不含）**，即UTC 2026-10-25 02:00至2026-10-26 02:00，续接上一份成功日报截止。

本次实际数据库核验时间：**2026-10-26 10:00:26.935 北京时间**（UTC 2026-10-26T02:00:26.93543+00:00），在逻辑截止后约27秒取数；正文整理时间：2026-10-26 10:02:47。当前库存是这一核验时点值，区间新增按真实published_at/created_at单独筛选。截止后截至核验时点无新增Pin，稍后的事件不计入本日报。

本区间确认**实际新增Pin 14条、补货入库8条**；两轮入库分别6条、2条，各有实际幂等重跑inserted=0证据。当前**96条有效库存、4条缺口**，没有把等待下一轮补货的缺口写成已补齐。本轮日报只读业务数据，未触发发布、补货、入队或业务修复。

### 逐账号汇总

| 账号 | 区间新增Pin | 核验时可用库存 | 缺口（target=3） | 草稿数 / 有图草稿数 |
|---|---|---|---|---|
| P1 icyndizhang | 3 | 55 | 1 | 55 / 0 |
| P2 sailing_981 | 3 | 18 | 0 | 26 / 0 |
| P3 mydecorshop | 3 | 7 | 2 | 4 / 3 |
| P4 cindyzhang62 | 3 | 11 | 0 | 0 / 0 |
| P5 ivy5205 | 2 | 5 | 1 | 0 / 0 |

五账号均active、OAuth已连接；上述草稿不计已审核库存，也不计发布成功。P5本区间确认为2条，其他账号各3条；不存在第三条可核实记录，具体未触发原因未确认，不能仅凭数量较少判定发布失败。

### P1 · icyndizhang：新增3条

| 北京时间 | 店铺与Etsy商品 | 实际Pin |
|---|---|---|
| 2026-10-25 10:05:02 | CustomCurtainsStudio [1739543167](https://www.etsy.com/listing/1739543167) | [801218590009481089](https://www.pinterest.com/pin/801218590009481089/) |
| 2026-10-25 21:00:03 | Parkermo [1702252202](https://www.etsy.com/listing/1702252202) | [801218590009488626](https://www.pinterest.com/pin/801218590009488626/) |
| 2026-10-26 08:00:05 | KorusStore [1270924141](https://www.etsy.com/listing/1270924141) | [801218590009498213](https://www.pinterest.com/pin/801218590009498213/) |

### P2 · sailing_981：新增3条

| 北京时间 | 店铺与Etsy商品 | 实际Pin |
|---|---|---|
| 2026-10-25 10:10:01 | HibiChStudio [4454342176](https://www.etsy.com/listing/4454342176) | [863494928599285662](https://www.pinterest.com/pin/863494928599285662/) |
| 2026-10-25 21:05:02 | LambertHouse [1790823175](https://www.etsy.com/listing/1790823175) | [863494928599292388](https://www.pinterest.com/pin/863494928599292388/) |
| 2026-10-26 08:05:05 | KoltCraftStudio [4434422856](https://www.etsy.com/listing/4434422856) | [863494928599300753](https://www.pinterest.com/pin/863494928599300753/) |

### P3 · mydecorshop：新增3条

| 北京时间 | 店铺与Etsy商品 | 实际Pin |
|---|---|---|
| 2026-10-25 10:30:02 | Chtte [4514553651](https://www.etsy.com/listing/4514553651) | [499618152434251460](https://www.pinterest.com/pin/499618152434251460/) |
| 2026-10-25 21:10:06 | CellaHo [4432320593](https://www.etsy.com/listing/4432320593) | [499618152434253785](https://www.pinterest.com/pin/499618152434253785/) |
| 2026-10-26 08:30:02 | LoomGoStudio [4498620868](https://www.etsy.com/listing/4498620868) | [499618152434258555](https://www.pinterest.com/pin/499618152434258555/) |

### P4 · cindyzhang62：新增3条

| 北京时间 | 店铺与Etsy商品 | 实际Pin |
|---|---|---|
| 2026-10-25 10:20:02 | QuGifts [4338894105](https://www.etsy.com/listing/4338894105) | [675399275414578694](https://www.pinterest.com/pin/675399275414578694/) |
| 2026-10-25 21:25:02 | ChicDecorHK [1170079452](https://www.etsy.com/listing/1170079452) | [675399275414585416](https://www.pinterest.com/pin/675399275414585416/) |
| 2026-10-26 08:20:03 | PearlsTreasuresArt [1899462379](https://www.etsy.com/listing/1899462379) | [675399275414596616](https://www.pinterest.com/pin/675399275414596616/) |

### P5 · ivy5205：新增2条

| 北京时间 | 店铺与Etsy商品 | 实际Pin |
|---|---|---|
| 2026-10-25 21:30:03 | NinaJiaStudio [4585549341](https://www.etsy.com/listing/4585549341) | [713820609737615581](https://www.pinterest.com/pin/713820609737615581/) |
| 2026-10-26 08:25:01 | NngGoods [4301773735](https://www.etsy.com/listing/4301773735) | [713820609737624793](https://www.pinterest.com/pin/713820609737624793/) |

以上14个Pin ID唯一，均有publish_history的published记录，并通过已审核队列关联到商品和店铺。昨日北京时间21:00–23:00窗口的实际Pin为各账号表中10月25日21时的5条：P1 21:00:03、P2 21:05:02、P3 21:10:06、P4 21:25:02、P5 21:30:03。今日08时窗口的5条仍属于本日报；昨日10时窗口的4条也属于本区间。

### 区间全部真实补货：8条

以下8个唯一queue_id的created_at都在本区间内。当前均queue_status=ready、snapshot_matches=true、source_matches=true、eligible_configuration=true，尚未发布；入库成功不等于已发Pin。

| 店铺与Etsy商品 | 账号/handle | Board名称/ID | queue_id | 实际入库北京时间 | queue_status / snapshot_matches |
|---|---|---|---|---|---|
| Adamideal [4486775612](https://www.etsy.com/listing/4486775612/wooden-cable-organizer-multi-slot-wire) | P2 sailing_981 | storage / 863494997243989843 | 78f3174c-47c6-4a16-b1db-ae96676d20f3 | 2026-10-25 13:18:10 | ready / true |
| CustomCurtainsStudio [4544256338](https://www.etsy.com/listing/4544256338/woven-textured-knit-sheer-curtains) | P1 icyndizhang | CyndiZhangStudio / 801218658646993070 | 43c77c97-233c-4cb2-bcd5-89553e804963 | 2026-10-25 13:18:13 | ready / true |
| FrenchStyleDecor [4296817061](https://www.etsy.com/listing/4296817061/floral-embroidered-lace-cushion-cover) | P1 icyndizhang | CyndiZhangStudio / 801218658646993070 | f14da872-fbf1-4b96-9efd-800e54a653b1 | 2026-10-25 13:18:13 | ready / true |
| HibiChStudio [4391681449](https://www.etsy.com/listing/4391681449/canvas-wall-hanging-organizer-bedside) | P2 sailing_981 | storage / 863494997243989843 | cc41446c-156d-44b2-bb04-43d947227067 | 2026-10-25 13:18:14 | ready / true |
| LoomGoStudio [4416535984](https://www.etsy.com/listing/4416535984/linen-and-cotton-jacquard-fabric-floral) | P3 mydecorshop | Home Decor / 499618221101238533 | beeca7b6-0642-4e9d-ae39-fe3845202a4e | 2026-10-25 13:18:17 | ready / true |
| NngGoods [4301774308](https://www.etsy.com/listing/4301774308/crystal-cabinet-knob-modern-brass-drawer) | P5 ivy5205 | Furniture / 713820678377803412 | fac1e534-1430-4b19-97ef-a4536fa4fad3 | 2026-10-25 13:18:19 | ready / true |
| LambertHouse [1789516737](https://www.etsy.com/listing/1789516737/10-piece-matte-gold-aluminum-hangers-165) | P2 sailing_981 | storage / 863494997243989843 | f08b94ab-9b81-4726-b482-97ea9702064c | 2026-10-26 01:17:33 | ready / true |
| Parkermo [1555653880](https://www.etsy.com/listing/1555653880/checkered-semi-blackout-curtains) | P1 icyndizhang | CyndiZhangStudio / 801218658646993070 | 4aa304bf-e8a9-4331-8891-ef55e7bb0afb | 2026-10-26 01:17:35 | ready / true |

**第一轮：北京时间10月25日13:18，新增6条。** [批次051721](https://github.com/Sailin09/Store-Promotion/blob/main/operations/replenishment/batch-20261025-051721.json)；[真实入库与实际重跑日志，run40164989090/job121084159232](https://github.com/Sailin09/Store-Promotion/actions/runs/40164989090/job/121084159232)。首次inserted=6、failed=0、pending=6；第二次实际执行返回no_new_verified_material、inserted=0。库存98→104，缺口7→1。

**第二轮：北京时间10月26日01:17，新增2条。** [批次171640](https://github.com/Sailin09/Store-Promotion/blob/main/operations/replenishment/batch-20261025-171640.json)；[真实入库与实际重跑日志，run40215693164/job121236326452](https://github.com/Sailin09/Store-Promotion/actions/runs/40215693164/job/121236326452)。首次inserted=2、failed=0、pending=2；第二次实际执行返回no_new_verified_material、inserted=0。库存99→101，缺口3→1。

两轮日志已在本日报中重新读取，非只引用workflow success。累计实际新增8条、入库失败0条，防重复重跑新增均为0。区间内没有把历史全量批次、10月23日首次两条或10月24日批次重复计为今日新增。

**来源与实际图片核验证据**：均来自对应登记店铺当时的当前storefront，先排除known_listing_ids；详情页卖家/店铺归属匹配，选定在售规格后Add to cart可用，实际查看云端CDP主图截图。以下时间是当时核验时间，本日报没有重新浏览Etsy或刷新旧checked_at。

- **Adamideal / 4486775612**：北京时间2026-10-25 13:15:00。深棕色长条三槽木质理线器，圆角端部，白色线缆穿过槽口；Black Walnut、Small。 [原图](https://i.etsystatic.com/35172699/r/il/81dc57/7948029341/il_794xN.7948029341_aodr.jpg)。
- **CustomCurtainsStudio / 4544256338**：北京时间2026-10-25 13:15:28。木框窗边米白透光窗帘，织面有重复镂空方格与横向纹理；1PCS W39×L59英寸、Rod Pocket。 [原图](https://i.etsystatic.com/38873964/r/il/c3e27c/8686524222/il_794xN.8686524222_9vvo.jpg)。
- **FrenchStyleDecor / 4296817061**：北京时间2026-10-25 13:15:56。白色方形靠垫套，凸起叶片花卉与弯曲花茎；另看A款小花藤规格图，选择A-Pillowcase、18×18英寸。 [原图](https://i.etsystatic.com/33874695/r/il/9b46cb/8589448149/il_794xN.8589448149_6dtr.jpg)。
- **HibiChStudio / 4391681449**：北京时间2026-10-25 13:16:24。浅色木杆支撑的米白挂墙布袋，收纳厨具，下方有小袋和篮状袋；M。 [原图](https://i.etsystatic.com/59640782/r/il/935262/7396941851/il_794xN.7396941851_ln31.jpg)。
- **LoomGoStudio / 4416535984**：北京时间2026-10-25 13:16:48。折叠的米白提花面料，大幅凸起花卉轮廓与织纹；1 Yard。 [原图](https://i.etsystatic.com/58959935/r/il/2bcedb/7523921300/il_794xN.7523921300_e5j5.jpg)。
- **NngGoods / 4301774308**：北京时间2026-10-25 13:17:15。白色柜门上的粉色球形旋钮和金色锥形底座；另看黄/白/蓝规格图，选择Yellow、1 PCS。卖家说明珠体人工染色。 [原图](https://i.etsystatic.com/57194200/r/il/540f5a/6843827942/il_794xN.6843827942_ok3a.jpg)。
- **LambertHouse / 1789516737**：北京时间2026-10-26 01:16:12。深色衣柜杆上一排金色纤细金属三角衣架，圆肩和横杆清晰；C01、5 PCS。 [原图](https://i.etsystatic.com/46944744/r/il/730909/6300922109/il_794xN.6300922109_gd1j.jpg)。
- **Parkermo / 1555653880**：北京时间2026-10-26 01:16:40。窗边灰棕与奶油色小格纹窗帘近景，深褶和织纹清晰；Rod Pocket、1 PC W39×L59英寸。 [原图](https://i.etsystatic.com/41687571/r/il/f3b116/7145815004/il_794xN.7145815004_c4xp.jpg)。

### 其他轮次、候选及未解决缺口

| 北京时间 / 证据 | 实际新增入队 | 当时库存 / 缺口 | 说明 |
|---|---|---|---|
| 10月25日19:18，[记录111729](https://github.com/Sailin09/Store-Promotion/blob/main/operations/replenishment/cloud-run-20261025-111729.json) | 0 | 104 / 1 | Chtte当前7个商品ID全部已知，无新候选，未调用入库。 |
| 10月26日07:18，[记录231816](https://github.com/Sailin09/Store-Promotion/blob/main/operations/replenishment/cloud-run-20261025-231816.json) | 0 | 101 / 1 | 同样排除7个已知ID，未调用入库。 |

零入队轮次没有执行新的入库重跑，不能把它们写成幂等测试成功。没有已核验但未入库的新候选被计入成功。

Chtte/P3持续缺1条：最近现场店铺仅7个成品坐垫ID，全部已入库；未复用旧商品或不可用布料4325858718。P3仍为mydecorshop的Kitchen & Dining 499618221101215211，分类Chair Cushions & Seat Pads；未修改账号/Board映射。KorusStore/P1、LoomGoStudio/P3、NngGoods/P5在今早发布后各形成1条缺口，**当前尚未补齐，等待后续受控补货**。

首次缺口跟进状态保持completed：10月23日首次2条已有真实入库、ready/snapshot及实际零新增重跑证据；这是历史闭环，不计本区间8条，也不代表长期补货结束。

### 当前全部路线库存

核验时点共有30店铺、32路线，可用**96**、总缺口**4**，每路线target仍为3。下表是当前库存，不是本日新增数。

| 账号 | 店铺 | usable | deficit |
|---|---|---|---|
| P1 | AmyHomeCrafts | 3 | 0 |
| P1 | beou | 3 | 0 |
| P1 | ChicDecorHK | 3 | 0 |
| P1 | Chtte | 3 | 0 |
| P1 | CustomCurtainsStudio | 3 | 0 |
| P1 | DanyHomeDesign | 3 | 0 |
| P1 | FrenchStyleDecor | 3 | 0 |
| P1 | GavinHome | 3 | 0 |
| P1 | HeyDream | 3 | 0 |
| P1 | KorusStore | 2 | 1 |
| P1 | MiraKiuStudio | 3 | 0 |
| P1 | NiceCraftStudioHK | 3 | 0 |
| P1 | Parkermo | 3 | 0 |
| P1 | ShirieHomeShow | 3 | 0 |
| P1 | SobiaStudio | 3 | 0 |
| P1 | StellaGoodsGifts | 3 | 0 |
| P1 | TunaMunStudio | 3 | 0 |
| P1 | WOGOL | 5 | 0 |
| P2 | Adamideal | 3 | 0 |
| P2 | HibiChStudio | 3 | 0 |
| P2 | KoltCraftStudio | 3 | 0 |
| P2 | LambertHouse | 3 | 0 |
| P2 | MiawoodStudio | 3 | 0 |
| P2 | WoodHomeLiang | 3 | 0 |
| P3 | CellaHo | 3 | 0 |
| P3 | Chtte | 2 | 1 |
| P3 | LoomGoStudio | 2 | 1 |
| P4 | ChicDecorHK | 4 | 0 |
| P4 | PearlsTreasuresArt | 3 | 0 |
| P4 | QuGifts | 4 | 0 |
| P5 | NinaJiaStudio | 3 | 0 |
| P5 | NngGoods | 2 | 1 |

相邻日报近截止核验值对账：102 + 本区间入库8 − 本区间发布14 = 96。102是上一日报实际核验时点值，不是历史累计62条发布基线，也不冒充精确截止快照。

### 待发布、失败、修复与证据边界

- 当前96条ready/scheduled储备均通过配置、来源及snapshot核验；当前未完成发布attempt为0、队列paused/failed为0，已读取的审核发布行error为空。仍须遵守每店铺每日1条、24小时间隔、账号间隔及发布窗口，因此ready不代表立即发布。
- 最新发布job121348985586在北京时间09:12的实际返回为idle、published=0；该次没有新增Pin。实际新增14条由完整publish_history证明，不能以job success或HTTP200替代。
- 最新只读日志的调度HTTP查询仅保留最近20条，cron仅最近10条；**全区间每次HTTP失败/短暂错误覆盖不完整，未确认**。不能据当前无未完成attempt推断全天从未异常。截止后10:00:00请求在取数时仍待完成，未作为失败或成功计入。
- 本日报未执行业务修复。已完成的可控事项是两轮真实补货和两次防重复验证；尚未解决的是上述4条缺口，以及平台推送/设备通知送达仍未确认。昨日通知测试和prompt恢复记录不等于推送已送达，亦不影响本次业务计数。
- [历史发布复核Issue #3](https://github.com/Sailin09/Store-Promotion/issues/3)为10月23日21:35数据快照，报告实际到UTC17:57才生成，约延迟4小时22分钟；首段113混入后续库存，不能当作21:35库存或本日报基线。历史快照与报告投递时间继续分开。

### 数据来源与投递

本轮已通过GitHub连接器读取最新main、证据目录、Issue #2全部14条既有评论，并按标题搜索发布复核Issue。未发现本日唯一标记，投递采用本日单条评论，保留历史。

[本次新只读Verify：run40215764533/job121360658616](https://github.com/Sailin09/Store-Promotion/actions/runs/40215764533/job/121360658616)。daily_history查询无LIMIT，从北京时间10月25日00:00起返回全部19条记录，覆盖完整日报区间；区间内筛出14条，全部与商品/店铺关联成功，无重复Pin。队列与库存查询同样为只读；完整日志248685字符。

[完整日报存档](https://github.com/Sailin09/Store-Promotion/blob/main/operations/replenishment/daily-report-2026-10-26.md) · [配套证据](https://github.com/Sailin09/Store-Promotion/blob/main/operations/replenishment/daily-report-2026-10-26.json)。同一完整正文用于本聊天和GitHub Issue #2当日评论；评论正文将读回确认。聊天最终正文可见与系统推送、设备实际收到是不同状态，后两项仍未确认。
