# 执行日报 2026-10-29

<!-- store-promotion-daily:2026-10-29 -->

统计区间：**北京时间2026-10-28 10:00（含）至2026-10-29 10:00（不含）**，即UTC 2026-10-28 02:00至2026-10-29 02:00，续接上次成功日报截止。

实际数据库核验：**北京时间2026-10-29 10:02:51.621**（UTC 2026-10-29T02:02:51.621464+00:00），比逻辑截止晚约2分52秒；正文整理和投递在此之后。当前库存为核验时点值，区间新增按真实published_at与queue.created_at筛选。截止后至该核验时点没有新增Pin；其后事件不计入本区间。

本区间确认**新增Pin 13条、真实补货入库11条**。两轮分别入库7条和4条、失败均0，实际幂等重跑各inserted=0。当前**可用86条、缺口10条**，未全部补齐。草稿、候选、workflow success及HTTP200 idle均不算发布或补货成功。本日报只读核验业务，没有触发发布、补货、入队、业务修复或修改相关任务。

### 逐账号汇总

| 账号 | 区间新增Pin | 当前usable | 当前缺口（target=3） | 草稿 / 有图草稿 |
|---|---|---|---|---|
| P1 icyndizhang | 3 | 53 | 1 | 55 / 0 |
| P2 sailing_981 | 3 | 15 | 3 | 26 / 0 |
| P3 mydecorshop | 2 | 5 | 4 | 4 / 3 |
| P4 cindyzhang62 | 3 | 8 | 1 | 0 / 0 |
| P5 ivy5205 | 2 | 5 | 1 | 0 / 0 |

五账号均active、OAuth已连接，账号状态authorized_trial，发布设置enabled、access_tier=standard。P3和P5各确认2条，其他账号各3条；未发现两账号第三条区间发布记录，具体未触发原因未确认，不能仅因数量较少认定失败。

### P1 · icyndizhang：新增3条

| 北京时间 | 店铺 / Etsy商品 | 实际Pin |
|---|---|---|
| 2026-10-28 10:05:01 | DanyHomeDesign [4481217943](https://www.etsy.com/listing/4481217943) | [801218590009535586](https://www.pinterest.com/pin/801218590009535586/) |
| 2026-10-28 21:00:03 | Chtte [4440783510](https://www.etsy.com/listing/4440783510) | [801218590009542626](https://www.pinterest.com/pin/801218590009542626/) |
| 2026-10-29 08:00:03 | WOGOL [4556220466](https://www.etsy.com/listing/4556220466) | [801218590009551985](https://www.pinterest.com/pin/801218590009551985/) |

### P2 · sailing_981：新增3条

| 北京时间 | 店铺 / Etsy商品 | 实际Pin |
|---|---|---|
| 2026-10-28 10:10:02 | MiawoodStudio [1877234401](https://www.etsy.com/listing/1877234401) | [863494928599333659](https://www.pinterest.com/pin/863494928599333659/) |
| 2026-10-28 21:05:02 | KoltCraftStudio [4451568739](https://www.etsy.com/listing/4451568739) | [863494928599340089](https://www.pinterest.com/pin/863494928599340089/) |
| 2026-10-29 08:05:01 | WoodHomeLiang [1375376543](https://www.etsy.com/listing/1375376543) | [863494928599349003](https://www.pinterest.com/pin/863494928599349003/) |

### P3 · mydecorshop：新增2条

| 北京时间 | 店铺 / Etsy商品 | 实际Pin |
|---|---|---|
| 2026-10-28 21:25:02 | CellaHo [4512454460](https://www.etsy.com/listing/4512454460) | [499618152434277213](https://www.pinterest.com/pin/499618152434277213/) |
| 2026-10-29 08:45:02 | LoomGoStudio [4442580418](https://www.etsy.com/listing/4442580418) | [499618152434281188](https://www.pinterest.com/pin/499618152434281188/) |

### P4 · cindyzhang62：新增3条

| 北京时间 | 店铺 / Etsy商品 | 实际Pin |
|---|---|---|
| 2026-10-28 10:35:02 | QuGifts [1858091897](https://www.etsy.com/listing/1858091897) | [675399275414632139](https://www.pinterest.com/pin/675399275414632139/) |
| 2026-10-28 21:40:02 | ChicDecorHK [1125022447](https://www.etsy.com/listing/1125022447) | [675399275414639186](https://www.pinterest.com/pin/675399275414639186/) |
| 2026-10-29 08:35:02 | PearlsTreasuresArt [1867791265](https://www.etsy.com/listing/1867791265) | [675399275414647964](https://www.pinterest.com/pin/675399275414647964/) |

### P5 · ivy5205：新增2条

| 北京时间 | 店铺 / Etsy商品 | 实际Pin |
|---|---|---|
| 2026-10-28 21:45:01 | NinaJiaStudio [4435907497](https://www.etsy.com/listing/4435907497) | [713820609737669851](https://www.pinterest.com/pin/713820609737669851/) |
| 2026-10-29 08:40:01 | NngGoods [4301763578](https://www.etsy.com/listing/4301763578) | [713820609737679373](https://www.pinterest.com/pin/713820609737679373/) |

13个Pin ID唯一，均有无LIMIT的publish_history published记录，并逐条关联审核publication、商品ID与店铺；publication行error均为空、snapshot_matches均true。昨日10时窗口3条、昨日北京21:00–23:00窗口5条、今早08时窗口5条，均计入本区间；没有把累计62条当每日基线。

### 区间全部真实补货：11条

以下11个唯一queue_id的created_at均在区间内，当前全部**ready、snapshot_matches=true、source_matches=true、eligible_configuration=true**，尚未发布。当前储备中本区间新建队列也是11条，与批次及逐件inserted=1日志一致。入库成功不等于Pin发布成功。

| 店铺 / Etsy商品 | 账号 | Board名称 / ID | queue_id | 入库北京时间 | 状态 / snapshot |
|---|---|---|---|---|---|
| DanyHomeDesign [1886430383](https://www.etsy.com/listing/1886430383/botanical-print-semi-blackout-curtain) | P1 icyndizhang | CyndiZhangStudio / 801218658646993070 | 5305b74c-a8e1-4918-84c1-a2f1631d6e1b | 2026-10-28 13:19:23 | ready / true |
| LoomGoStudio [4365508063](https://www.etsy.com/listing/4365508063/plum-blossom-embroidered-linen-fabric) | P3 mydecorshop | Home Decor / 499618221101238533 | 704c5f2f-d4c9-46c4-9257-adb94bebe947 | 2026-10-28 13:19:24 | ready / true |
| MiawoodStudio [1877279919](https://www.etsy.com/listing/1877279919/black-wooden-pants-hanger-with-brass) | P2 sailing_981 | storage / 863494997243989843 | 02d3380d-561d-4789-8b94-d958e1b47070 | 2026-10-28 13:19:27 | ready / true |
| NngGoods [4582971773](https://www.etsy.com/listing/4582971773/natural-crystal-cluster-drawer-pull) | P5 ivy5205 | Furniture / 713820678377803412 | ef7c2c45-7936-4094-814a-b1fd70c511d8 | 2026-10-28 13:19:30 | ready / true |
| PearlsTreasuresArt [4320754160](https://www.etsy.com/listing/4320754160/seashell-drop-earrings-boho-rhinestone) | P4 cindyzhang62 | 名称未确认 / 675399344058025061 | 65c36a36-097c-4c00-bbf1-9b437d115372 | 2026-10-28 13:19:32 | ready / true |
| QuGifts [1844301194](https://www.etsy.com/listing/1844301194/moon-shell-wind-chime-boho-wall-hanging) | P4 cindyzhang62 | 名称未确认 / 675399344056772225 | c70b683b-28b9-49c4-a3b8-8f47099276ea | 2026-10-28 13:19:34 | ready / true |
| StellaGoodsGifts [4315989559](https://www.etsy.com/listing/4315989559/colorful-horse-velvet-pillow-cover) | P1 icyndizhang | CyndiZhangStudio / 801218658646993070 | fb2d7204-ad61-4b3f-980b-8f2db346cad4 | 2026-10-28 13:19:36 | ready / true |
| CellaHo [1839598796](https://www.etsy.com/listing/1839598796/sheer-floral-embroidered-fabric) | P3 mydecorshop | Home Decor / 499618221101238533 | 43457bd1-d58d-4be4-a529-7826b821351d | 2026-10-29 01:28:52 | ready / true |
| ChicDecorHK [1678693571](https://www.etsy.com/listing/1678693571/beaded-seashell-pendant-necklace) | P4 cindyzhang62 | 名称未确认 / 675399344058025061 | 0c392ae6-a2d6-421d-97e1-05674ca460c0 | 2026-10-29 01:28:54 | ready / true |
| KoltCraftStudio [1883990072](https://www.etsy.com/listing/1883990072/ash-wood-hangers-non-slip-solid-wood) | P2 sailing_981 | storage / 863494997243989843 | e68a4c99-91d3-4299-ad6d-ca1d38d2772f | 2026-10-29 01:28:58 | ready / true |
| NinaJiaStudio [4435955425](https://www.etsy.com/listing/4435955425/floral-makeup-bag-travel-cosmetic) | P5 ivy5205 | 名称未确认 / 713820678377803445 | e65d39a5-4bea-408d-9ac3-4e6473896c4d | 2026-10-29 01:29:00 | ready / true |

PearlsTreasuresArt、QuGifts、ChicDecorHK及NinaJiaStudio的上述Board名称未确认，保留原ID；入库工作流实时验证账号归属及公有Board，未猜名称或修改映射。

**第一轮：北京时间10月28日13:19，实际新增7条。** [批次051837](https://github.com/Sailin09/Store-Promotion/blob/main/operations/replenishment/batch-20261028-051837.json)；[实际入库及重跑run40637254095/job122647063053](https://github.com/Sailin09/Store-Promotion/actions/runs/40637254095/job/122647063053)：首次inserted=7、failed=0、pending=7；第二次实际执行no_new_verified_material、inserted=0。库存85→92，缺口12→5。[本轮证据](https://github.com/Sailin09/Store-Promotion/blob/main/operations/replenishment/cloud-run-20261028-051423.json)。

**第二轮：北京时间10月29日01:28–01:29，实际新增4条。** [批次172742](https://github.com/Sailin09/Store-Promotion/blob/main/operations/replenishment/batch-20261028-172742.json)；[实际入库及重跑run40736000900/job122984818532](https://github.com/Sailin09/Store-Promotion/actions/runs/40736000900/job/122984818532)：首次inserted=4、failed=0、pending=4；第二次实际执行在01:29:01返回no_new_verified_material、inserted=0。库存87→91，缺口10→6。[本轮证据](https://github.com/Sailin09/Store-Promotion/blob/main/operations/replenishment/cloud-run-20261028-171842.json)。

本日报重新读取两轮实际job日志，逐件inserted=1合计11，累计失败0、真实重跑各0。没有重新执行入库，没有把10月23日首次2条或历史全量批次计入本区间。

### 来源与实际视觉核验

以下为补货时的原始现场证据。本日报没有重新访问Etsy、没有刷新checked_at。原记录均从各自登记店铺当时的current storefront发现未入库ID，排除known_listing_ids后进入真实详情核对卖家、分类、在售选项和启用的Add to cart，并实际查看远程CDP商品主图；没有把alt文本、搜索摘要或HTTP状态当视觉核验。

- **DanyHomeDesign / 1886430383**：北京时间2026-10-28 13:15:48；分类Floral Curtains。蓝色枝叶与红色浆果图案的浅色窗帘，旁有白桌、木钟；成品1 PCS-W39XL51 inch、Rod Pocket、数量1。未承诺遮光等级或面料成分。 [原图](https://i.etsystatic.com/44677612/r/il/fe8f4c/6711999034/il_794xN.6711999034_i0i4.jpg)。

- **LoomGoStudio / 4365508063**：北京时间2026-10-28 13:16:16；分类Home Decor Fabric。米色透光垂挂面料上有白色立体梅花和浅棕枝条；1 Yard、数量1，说明含窗帘、桌旗及家居装饰用途，避免成分和宽度矛盾。 [原图](https://i.etsystatic.com/58959935/r/il/1097fe/7227207319/il_794xN.7227207319_42u0.jpg)。

- **MiawoodStudio / 1877279919**：北京时间2026-10-28 13:16:40；分类Wooden Hangers。两只黑色扁木裤架，金色弯钩、横杆及两端夹子，挂在浅木衣杆上；1 pc、数量1、库存5。未承诺木种、纯黄铜或防滑性能。 [原图](https://i.etsystatic.com/32100253/r/il/5bb4b9/6707965335/il_794xN.6707965335_9w6m.jpg)。

- **NngGoods / 4582971773**：北京时间2026-10-28 13:17:06；分类Cabinet Knobs & Pulls。三枚琥珀红棕色晶簇拉手，金色边底座与外扩支柱，置于浅色多孔石面；1 PCS、数量1、库存5。未承诺天然宝石真实性。 [原图](https://i.etsystatic.com/57194200/r/il/508d28/8663598440/il_794xN.8663598440_ngjq.jpg)。

- **PearlsTreasuresArt / 4320754160**：北京时间2026-10-28 13:17:33；分类Seashell Jewelry。模特佩戴金色椭圆耳钉，下垂绿白螺壳，壳顶有透明闪亮装饰；Studs、数量1、库存4。未承诺防敏、宝石真实性或金属纯度。 [原图](https://i.etsystatic.com/46725934/r/il/2b7aae/6953150590/il_794xN.6953150590_ohko.jpg)。

- **QuGifts / 1844301194**：北京时间2026-10-28 13:17:59；分类Wall Decor。棕色月牙框下悬挂蓝、粉、黄、绿、白半透明圆片，置于蓝灰墙前；无尺寸/颜色选择、数量1、库存9。未承诺风铃音效。 [原图](https://i.etsystatic.com/38006525/r/il/71fdb3/6651376552/il_794xN.6651376552_18hg.jpg)。

- **StellaGoodsGifts / 4315989559**：北京时间2026-10-28 13:18:37；分类Decorative Pillow Covers。奶油色方枕套，粉红圆形内有装饰白黑马，黄色滚边、四角红流苏；18X18 inches、数量1、库存8，说明不含枕芯。 [原图](https://i.etsystatic.com/54217402/r/il/0421f1/8602083049/il_794xN.8602083049_c44b.jpg)。

- **CellaHo / 1839598796**：北京时间2026-10-29 01:23:12；分类Embroidered Fabric。浅色透光褶叠织物，细微亮条纹及绿茎白色花簇；无尺寸/颜色选项、数量1，说明按半码售卖，含装饰窗帘及桌旗用途。未沿用矛盾宽度单位。 [原图](https://i.etsystatic.com/39663062/r/il/d1eaea/6544649002/il_794xN.6544649002_j793.jpg)。

- **ChicDecorHK / 1678693571**：北京时间2026-10-29 01:25:00；分类Seashell Jewelry。布面模特上的彩色小珠项链，白色有棱贝壳吊坠带粉红斑点及金色边；无尺寸/颜色选项、数量1，运输电话个性化栏未填写。 [原图](https://i.etsystatic.com/32003756/r/il/ada651/5776140660/il_794xN.5776140660_5f4m.jpg)。

- **KoltCraftStudio / 1883990072**：北京时间2026-10-29 01:26:58；分类Wooden Hangers。黑色台面上两只浅木弯肩衣架，红色及黄/金色金属钩；1 PCS、For Man-42.5 cm、数量1。规格更新后重新确认购物车启用，并返回第一张原始主图查看；原图有卖家水印。 [原图](https://i.etsystatic.com/43671795/r/il/765288/6766873356/il_794xN.6766873356_mhhg.jpg)。

- **NinaJiaStudio / 4435955425**：北京时间2026-10-29 01:27:42；分类Cosmetic Bags。浅奶油/粉色拉链包，粉色与橙色立体花、绿叶及金色拉链，置于白色表面；Orange、数量1、库存5，选项加载后购物车启用；原图有卖家水印，未承诺矛盾的成分。 [原图](https://i.etsystatic.com/61131894/r/il/6b2bd8/7579483490/il_794xN.7579483490_lhhw.jpg)。

### 零入队轮次、候选与未解决缺口

| 北京时间 / 证据 | 新增入队 | 当时usable / deficit | 事实 |
|---|---|---|---|
| 10月28日19:13，[111305](https://github.com/Sailin09/Store-Promotion/blob/main/operations/replenishment/cloud-run-20261028-111305.json) | 0 | 92 / 5 | Chtte与HibiChStudio符合既有分类的商品均已知，未调用入库或幂等重跑。 |
| 10月29日07:19，[231908](https://github.com/Sailin09/Store-Promotion/blob/main/operations/replenishment/cloud-run-20261028-231908.json) | 0 | 91 / 6 | 重新核验库存并现场检查当前店铺，仍无合格未入库ID；未刷新旧视觉证据。 |

零入队轮次不计补货成功，也不称防重复验证成功。未入库候选：StellaGoodsGifts [4579441057](https://www.etsy.com/listing/4579441057/green-monkeys-velvet-pillow-cover)，标题为绿猴，描述却复制马/红色细节；当轮排除，改选已核验的4315989559。该候选visual_verified=false，未入队、不计成功。

当前剩余10条缺口：**Chtte/P3缺3，HibiChStudio/P2缺2，Chtte/P1、LoomGoStudio/P3、NngGoods/P5、PearlsTreasuresArt/P4、WoodHomeLiang/P2各缺1。** 后4家在今早发布后形成缺口，尚未补齐，等待后续受控补货；日报不触发补货。

最近现场Chtte7件坐垫ID全部已知；P3仍沿用mydecorshop的Kitchen & Dining 499618221101215211、Chair Cushions & Seat Pads，旧布料4325858718不可用，P1/P3不共用商品ID。HibiChStudio16件中符合Wall & Door Organizers的7件均已知，其余袋、箱和衣物罩不扩分类入队。

首次缺口跟进状态仍completed：10月23日首次2条已有真实入库、ready/snapshot与实际零新增重跑证据；属于历史闭环，不计本日报11条，也不代表长期补货结束。

### 当前全部路线库存

核验时点为30店铺、32路线，usable合计86、deficit合计10；每路线target仍为3。下表是当前库存，不是每日新增数。

| 账号 | 店铺 | usable | deficit |
|---|---|---|---|
| P1 | AmyHomeCrafts | 3 | 0 |
| P1 | beou | 3 | 0 |
| P1 | ChicDecorHK | 3 | 0 |
| P1 | Chtte | 2 | 1 |
| P1 | CustomCurtainsStudio | 3 | 0 |
| P1 | DanyHomeDesign | 3 | 0 |
| P1 | FrenchStyleDecor | 3 | 0 |
| P1 | GavinHome | 3 | 0 |
| P1 | HeyDream | 3 | 0 |
| P1 | KorusStore | 3 | 0 |
| P1 | MiraKiuStudio | 3 | 0 |
| P1 | NiceCraftStudioHK | 3 | 0 |
| P1 | Parkermo | 3 | 0 |
| P1 | ShirieHomeShow | 3 | 0 |
| P1 | SobiaStudio | 3 | 0 |
| P1 | StellaGoodsGifts | 3 | 0 |
| P1 | TunaMunStudio | 3 | 0 |
| P1 | WOGOL | 3 | 0 |
| P2 | Adamideal | 3 | 0 |
| P2 | HibiChStudio | 1 | 2 |
| P2 | KoltCraftStudio | 3 | 0 |
| P2 | LambertHouse | 3 | 0 |
| P2 | MiawoodStudio | 3 | 0 |
| P2 | WoodHomeLiang | 2 | 1 |
| P3 | CellaHo | 3 | 0 |
| P3 | Chtte | 0 | 3 |
| P3 | LoomGoStudio | 2 | 1 |
| P4 | ChicDecorHK | 3 | 0 |
| P4 | PearlsTreasuresArt | 2 | 1 |
| P4 | QuGifts | 3 | 0 |
| P5 | NinaJiaStudio | 3 | 0 |
| P5 | NngGoods | 2 | 1 |

相邻日报核验值对账：**88 + 本区间入库11 − 本区间发布13 = 86**。88为上一日报实际核验时点库存，不能冒充精确截止快照。逐路线加总缺口为10。

### 未发布、失败、修复与证据边界

- 当前86条ready/scheduled储备均通过来源、配置及snapshot核验；当前未完成发布attempt为0，队列paused/failed合计0。区间13条publication error均空，不代表全天没有瞬时异常。
- 发布设置及数据库调度仍启用。每店铺每日1条、24小时间隔、45天evergreen重复保护、账号最小间隔2小时及08:00–11:00/21:00–23:00发布窗口保持原样；ready不代表可立即发布。
- 最新已读发布[run40802640454/job123214089912](https://github.com/Sailin09/Store-Promotion/actions/runs/40802640454/job/123214089912)于北京时间09:48实际返回idle、published=0、jobs=1；该次无新增Pin，具体idle原因未返回。13条实际发布由完整历史证明，不能用workflow success或HTTP200代替。
- 调度日志仅最近20条HTTP及最近10条cron，**全区间每一次请求及瞬时错误覆盖不完整，未确认**。截止后的10:00请求在核验日志中仍待完成，不计成功或失败；未触发额外发布。
- 本日报没有执行业务修复，保留现有修复安排。区间完成两轮补货及两次真实幂等验证，未解决的是上述10条缺口。正文写入聊天、平台通知发送及设备实际收到是不同状态，后两者仍未确认。
- 按标题搜索读取[历史发布复核Issue #3](https://github.com/Sailin09/Store-Promotion/issues/3)：快照为10月23日21:35，报告在UTC17:57才生成，约延迟4小时22分；首段113混入后续库存，不能作为21:35库存或本日报基线。

### 数据来源与双端投递

本次通过GitHub连接器读取最新main证据目录、两个区间batch、四份cloud-run、first-deficit-followup.json、云端运行说明、发布/补货工作流及两轮实际入库日志，读取Issue #2正文及全部32条既有评论，并按标题搜索发布复核Issue。未发现本日唯一标记，使用当日单条评论，保留其他日期历史。

[本次重新执行的只读Verify：run40736163234/job123218464215](https://github.com/Sailin09/Store-Promotion/actions/runs/40736163234/job/123218464215)。daily_history查询无LIMIT，从北京时间10月28日00:00起返回全部18条历史，覆盖完整区间，按真实时间筛出13条，均关联商品及店铺且无重复Pin。完整日志258371字符。当前库存、储备及账号状态均来自此次新核验。

[完整日报存档](https://github.com/Sailin09/Store-Promotion/blob/main/operations/replenishment/daily-report-2026-10-29.md) · [配套证据](https://github.com/Sailin09/Store-Promotion/blob/main/operations/replenishment/daily-report-2026-10-29.json)。同一完整正文用于本聊天最终响应与Issue #2当日唯一评论，评论与存档会读回核对；聊天正文仍待独立读回，平台通知及设备实际收到保持未确认。
