# 执行日报 2026-10-28

<!-- store-promotion-daily:2026-10-28 -->

统计区间：**北京时间2026-10-27 10:00（含）至2026-10-28 10:00（不含）**，即UTC 2026-10-27 02:00至2026-10-28 02:00，续接上次成功日报截止。

本次实际数据库核验为**北京时间2026-10-28 10:04:42.256**（UTC 2026-10-28T02:04:42.256769+00:00），比逻辑截止晚约4分42秒；正文整理在此之后。当前库存为该核验时点值；区间新增按真实published_at及queue.created_at筛选。截止后至核验时点未发现新增Pin，后续事件不计入本区间。

本区间确认**新增Pin 14条、真实补货入库12条**。两轮分别新增7条、5条，实际幂等重跑均inserted=0、失败均0。当前**可用88条、缺口9条**，仍未全部补齐。本日报只读核验业务，未触发发布、补货、入队、业务修复或修改任何相关任务。

### 逐账号汇总

| 账号 | 区间新增Pin | 当前usable | 缺口（target=3） | 草稿 / 有图草稿 |
|---|---|---|---|---|
| P1 icyndizhang | 3 | 54 | 1 | 55 / 0 |
| P2 sailing_981 | 3 | 16 | 2 | 26 / 0 |
| P3 mydecorshop | 3 | 5 | 4 | 4 / 3 |
| P4 cindyzhang62 | 3 | 8 | 1 | 0 / 0 |
| P5 ivy5205 | 2 | 5 | 1 | 0 / 0 |

五账号均active、OAuth已连接。草稿不算审核库存或发布成功。P5确认2条，其他账号各3条；未发现P5第三条区间记录，具体未触发原因未确认，不仅凭数量较少认定失败。

### P1 · icyndizhang：新增3条

| 北京时间 | 店铺 / Etsy商品 | 实际Pin |
|---|---|---|
| 2026-10-27 10:05:02 | WOGOL [4438724155](https://www.etsy.com/listing/4438724155) | [801218590009517469](https://www.pinterest.com/pin/801218590009517469/) |
| 2026-10-27 21:00:03 | TunaMunStudio [4374365692](https://www.etsy.com/listing/4374365692) | [801218590009523717](https://www.pinterest.com/pin/801218590009523717/) |
| 2026-10-28 08:00:04 | StellaGoodsGifts [4316038513](https://www.etsy.com/listing/4316038513) | [801218590009533907](https://www.pinterest.com/pin/801218590009533907/) |

### P2 · sailing_981：新增3条

| 北京时间 | 店铺 / Etsy商品 | 实际Pin |
|---|---|---|
| 2026-10-27 10:10:02 | KoltCraftStudio [4497139834](https://www.etsy.com/listing/4497139834) | [863494928599318739](https://www.pinterest.com/pin/863494928599318739/) |
| 2026-10-27 21:05:02 | Adamideal [4364186500](https://www.etsy.com/listing/4364186500) | [863494928599324035](https://www.pinterest.com/pin/863494928599324035/) |
| 2026-10-28 08:05:02 | HibiChStudio [4391650576](https://www.etsy.com/listing/4391650576) | [863494928599332376](https://www.pinterest.com/pin/863494928599332376/) |

### P3 · mydecorshop：新增3条

| 北京时间 | 店铺 / Etsy商品 | 实际Pin |
|---|---|---|
| 2026-10-27 10:40:02 | Chtte [4535407129](https://www.etsy.com/listing/4535407129) | [499618152434267183](https://www.pinterest.com/pin/499618152434267183/) |
| 2026-10-27 21:20:02 | CellaHo [4486870527](https://www.etsy.com/listing/4486870527) | [499618152434269790](https://www.pinterest.com/pin/499618152434269790/) |
| 2026-10-28 08:40:01 | LoomGoStudio [4416535984](https://www.etsy.com/listing/4416535984) | [499618152434274139](https://www.pinterest.com/pin/499618152434274139/) |

### P4 · cindyzhang62：新增3条

| 北京时间 | 店铺 / Etsy商品 | 实际Pin |
|---|---|---|
| 2026-10-27 10:30:01 | QuGifts [1858609385](https://www.etsy.com/listing/1858609385) | [675399275414615002](https://www.pinterest.com/pin/675399275414615002/) |
| 2026-10-27 21:35:02 | ChicDecorHK [1103128579](https://www.etsy.com/listing/1103128579) | [675399275414621059](https://www.pinterest.com/pin/675399275414621059/) |
| 2026-10-28 08:30:01 | PearlsTreasuresArt [4320437541](https://www.etsy.com/listing/4320437541) | [675399275414630596](https://www.pinterest.com/pin/675399275414630596/) |

### P5 · ivy5205：新增2条

| 北京时间 | 店铺 / Etsy商品 | 实际Pin |
|---|---|---|
| 2026-10-27 21:40:02 | NinaJiaStudio [4435968040](https://www.etsy.com/listing/4435968040) | [713820609737651496](https://www.pinterest.com/pin/713820609737651496/) |
| 2026-10-28 08:35:02 | NngGoods [4301774308](https://www.etsy.com/listing/4301774308) | [713820609737660830](https://www.pinterest.com/pin/713820609737660830/) |

以上14个Pin ID唯一，均有完整publish_history的published记录，并与已审核publication行、商品及店铺关联成功。昨日北京21:00–23:00实际5条、今早08时5条、昨日10时4条，均计入本区间；不套用预设发布时间，不用历史累计62条作每日基线。

### 区间全部真实补货：12条

12个唯一queue_id的created_at均在区间内，当前均为**ready、snapshot_matches=true、source_matches=true、eligible_configuration=true**，尚未发布。入库成功不等于Pin发布成功。

| 店铺 / Etsy商品 | 账号 | Board名称 / ID | queue_id | 入库北京时间 | 状态 / snapshot |
|---|---|---|---|---|---|
| KoltCraftStudio [1753876451](https://www.etsy.com/listing/1753876451/solid-wood-hangers-non-slip-coat-dress) | P2 sailing_981 | storage / 863494997243989843 | a54af9bb-ebe8-40f0-8a9e-2e24d60a6cee | 2026-10-27 13:25:46 | ready / true |
| LambertHouse [1797117653](https://www.etsy.com/listing/1797117653/silvery-aluminum-coat-hangers-extra) | P2 sailing_981 | storage / 863494997243989843 | 94f88d6f-2164-49cd-a220-dc206ce2c49c | 2026-10-27 13:25:46 | ready / true |
| LoomGoStudio [4356341420](https://www.etsy.com/listing/4356341420/embroidered-organza-fabric-crane-pine) | P3 mydecorshop | Home Decor / 499618221101238533 | ff2602cf-44b9-45c1-ae87-3462ed5c58d1 | 2026-10-27 13:25:48 | ready / true |
| NngGoods [4585511878](https://www.etsy.com/listing/4585511878/natural-coal-crystal-drawer-pull-brass) | P5 ivy5205 | Furniture / 713820678377803412 | 8c0202f8-2e20-4708-b648-9af9f3932dc6 | 2026-10-27 13:25:50 | ready / true |
| PearlsTreasuresArt [4320444542](https://www.etsy.com/listing/4320444542/boho-seashell-dangle-earrings-gold) | P4 cindyzhang62 | 名称未确认 / 675399344058025061 | f31d3843-a351-4afc-bc53-17a8832c5133 | 2026-10-27 13:25:51 | ready / true |
| QuGifts [1900963037](https://www.etsy.com/listing/1900963037/natural-shell-wall-hanging-boho-coastal) | P4 cindyzhang62 | 名称未确认 / 675399344056772225 | 98b5f13a-590f-4b43-a8d4-226512f1fc10 | 2026-10-27 13:25:52 | ready / true |
| ShirieHomeShow [4366227478](https://www.etsy.com/listing/4366227478/green-botanical-blackout-curtains) | P1 icyndizhang | CyndiZhangStudio / 801218658646993070 | 162d0433-1ebb-48a2-a4ae-431f57e704e6 | 2026-10-27 13:25:54 | ready / true |
| Adamideal [4362265334](https://www.etsy.com/listing/4362265334/natural-wood-pen-holder-handmade-elm) | P2 sailing_981 | storage / 863494997243989843 | 2bde8831-d364-4667-bc06-aff06687e10b | 2026-10-28 01:22:30 | ready / true |
| CellaHo [4512412605](https://www.etsy.com/listing/4512412605/herb-floral-embroidered-stripe-fabric) | P3 mydecorshop | Home Decor / 499618221101238533 | b02cc43b-9aca-4263-bdb1-16d4aba52897 | 2026-10-28 01:22:32 | ready / true |
| ChicDecorHK [1599224125](https://www.etsy.com/listing/1599224125/natural-white-seashell-constellation) | P4 cindyzhang62 | 名称未确认 / 675399344058025061 | 50cfb56f-3a82-42ce-96f4-53ca5f9e5c35 | 2026-10-28 01:22:33 | ready / true |
| NinaJiaStudio [4435912349](https://www.etsy.com/listing/4435912349/kawaii-rabbit-print-makeup-bag-large) | P5 ivy5205 | 名称未确认 / 713820678377803445 | 85dac9aa-3050-4b73-b019-588c06495897 | 2026-10-28 01:22:34 | ready / true |
| TunaMunStudio [4391069404](https://www.etsy.com/listing/4391069404/pumpkin-embroidered-valance-farmhouse) | P1 icyndizhang | CyndiZhangStudio / 801218658646993070 | b05ba4cb-eff8-4933-9694-a34411773156 | 2026-10-28 01:22:36 | ready / true |

PearlsTreasuresArt、ChicDecorHK、QuGifts及NinaJiaStudio的上述Board名称缺证据，保持未确认；ID沿用原路线，入库工作流已实时复核账号归属及公有Board，没有猜名或改映射。

**第一轮：北京时间10月27日13:25，真实新增7条。** [批次052451](https://github.com/Sailin09/Store-Promotion/blob/main/operations/replenishment/batch-20261027-052451.json)；[实际入库及重跑run40455197708/job122026900648](https://github.com/Sailin09/Store-Promotion/actions/runs/40455197708/job/122026900648)：首次inserted=7、failed=0、pending=7，第二次实际执行返回no_new_verified_material、inserted=0。库存86→93，缺口11→4。

**第二轮：北京时间10月28日01:22，真实新增5条。** [批次172132](https://github.com/Sailin09/Store-Promotion/blob/main/operations/replenishment/batch-20261027-172132.json)；[实际入库及重跑run40549867324/job122350577536](https://github.com/Sailin09/Store-Promotion/actions/runs/40549867324/job/122350577536)：首次inserted=5、failed=0、pending=5，第二次实际执行返回no_new_verified_material、inserted=0。库存88→93，缺口9→4。

两轮真实job日志已在本日报重新读取，12条均逐商品inserted=1，累计失败0，实际重跑各为0。未重复计入历史全量批次、10月23日首次2条或前一日报素材。

### 来源与实际视觉核验

12条均来自各自登记店铺当时的当前storefront，排除known_listing_ids后进入真实详情确认卖家/店铺归属及在售选项，已加载规格与Add to cart可用，并实际查看远程CDP商品主图。下列是原始核验时间及记录，本日报没有重新浏览Etsy或刷新checked_at：

- **KoltCraftStudio / 1753876451**：北京时间2026-10-27 13:19:56；分类Wooden Hangers。深棕色木衣架排在银色衣杆上，金色挂钩，下方白色衣物；3 PCS、数量1。 [原图](https://i.etsystatic.com/43671795/r/il/b40035/6136880607/il_794xN.6136880607_344z.jpg)。

- **LambertHouse / 1797117653**：北京时间2026-10-27 13:20:36；分类Closet Organization。深色衣柜内，青铜色衣杆上成组宽扁银色三角金属衣架；C01、2 PCS、数量1。 [原图](https://i.etsystatic.com/46944744/r/il/28d350/6333416945/il_794xN.6333416945_p9hp.jpg)。

- **LoomGoStudio / 4356341420**：北京时间2026-10-27 13:21:19；分类Home Decor Fabric。米白透光织物上有浅色松针枝条及展翅鹤鸟；1 Yard、数量1，非小样；说明含家居装饰用途。 [原图](https://i.etsystatic.com/58959935/r/il/7fe051/7178192927/il_794xN.7178192927_2i1v.jpg)。

- **NngGoods / 4585511878**：北京时间2026-10-27 13:22:14；分类Cabinet Knobs & Pulls。三个黑色不规则晶簇带蓝紫金色反光，配金色圆底座，侧放件可见螺孔；1 PCS、数量1；未承诺天然矿物真实性。 [原图](https://i.etsystatic.com/57194200/r/il/414c17/8663553548/il_794xN.8663553548_fzy1.jpg)。

- **PearlsTreasuresArt / 4320444542**：北京时间2026-10-27 13:23:02；分类Seashell Jewelry。模特耳部展示金色几何圆角片，下垂三串白色螺壳；Hooks、数量1；页面库存4，未承诺防敏或金属纯度。 [原图](https://i.etsystatic.com/46725934/r/il/26bbe6/7001137645/il_794xN.7001137645_c6de.jpg)。

- **QuGifts / 1900963037**：北京时间2026-10-27 13:23:56；分类Wall Decor。浅色墙面上金色弧杆悬挂渐变长短的米白圆贝片，三角挂绳清楚；无规格选项、数量1，页面库存5。 [原图](https://i.etsystatic.com/38006525/r/il/7c8127/8302818498/il_794xN.8302818498_iwho.jpg)。

- **ShirieHomeShow / 4366227478**：北京时间2026-10-27 13:24:51；分类French Country Curtains。手持浅绿色窗帘，蓝紫粉水彩花朵、黄绿叶和细茎清楚；成品1 PCS-W39XL47 inches、C01、数量1，非小样；未承诺全遮光。 [原图](https://i.etsystatic.com/46873252/r/il/fe71d6/7231016475/il_794xN.7231016475_4j38.jpg)。

- **Adamideal / 4362265334**：北京时间2026-10-28 01:18:55；分类Desk Organization。浅色台面上两个粗纹理圆木笔筒，一个直立装剪刀、笔和蓝色记号笔，另一个横放露出孔口；无尺寸/颜色选项、数量1。 [原图](https://i.etsystatic.com/35172699/r/il/54e5a8/7210563951/il_794xN.7210563951_bdwz.jpg)。

- **CellaHo / 4512412605**：北京时间2026-10-28 01:19:39；分类Embroidered Fabric。浅绿/米白条纹褶叠面料，上有白黄小花和紫色香草刺绣；0.5 Yards、数量1；说明含窗帘、桌布及家居手工用途。 [原图](https://i.etsystatic.com/39663062/r/il/3f8631/8117102189/il_794xN.8117102189_l7vq.jpg)。

- **ChicDecorHK / 1599224125**：北京时间2026-10-28 01:20:23；分类Seashell Jewelry。手持金色圆环配珍珠白螺壳和小圆星座吊饰；Normal-3-4 cm、Sagittarius、数量1；未承诺防敏、金纯度或好运。 [原图](https://i.etsystatic.com/32003756/r/il/09c631/5553654328/il_794xN.5553654328_md6l.jpg)。

- **NinaJiaStudio / 4435912349**：北京时间2026-10-28 01:20:53；分类Cosmetic Bags。两只奶油色拉链包，粉兔、红色郁金香及蝴蝶结图案，小包敞口旁有化妆品；Small、数量1，页面库存5。 [原图](https://i.etsystatic.com/61131894/r/il/fafcb2/7623714483/il_794xN.7623714483_2w6o.jpg)。

- **TunaMunStudio / 4391069404**：北京时间2026-10-28 01:21:32；分类Cafe Curtains。窗下半幅奶油色帘，橙南瓜和绿藤刺绣，黄色格纹荷叶下摆；Rod pocket、W47xL12 inch - 1 PC、数量1。 [原图](https://i.etsystatic.com/60242016/r/il/fe1bef/7363014397/il_794xN.7363014397_gihq.jpg)。

### 零入队轮次、候选与缺口

| 北京时间 / 证据 | 新增 | 当时usable / deficit | 事实 |
|---|---|---|---|
| 10月27日19:18，[111846](https://github.com/Sailin09/Store-Promotion/blob/main/operations/replenishment/cloud-run-20261027-111846.json) | 0 | 93 / 4 | Chtte7件及HibiChStudio合适分类商品全部已知，未执行入库或幂等重跑。 |
| 10月28日07:19，[231944](https://github.com/Sailin09/Store-Promotion/blob/main/operations/replenishment/cloud-run-20261027-231944.json) | 0 | 93 / 4 | 重新读库存及现场店铺，仍无合格未入库ID；未刷新旧视觉证据。 |

零入队轮次不计补货成功，也不称幂等验证。未入库候选：ChicDecorHK [1640975851](https://www.etsy.com/listing/1640975851/handmade-pearl-and-white-seashell)，详情存在具体搭扣质量投诉，当轮改选另一个已核验新品；该备选没有visual_verified声明，未入队、不计成功。

当前缺口9条：**Chtte/P3可用0、缺3；HibiChStudio/P2可用1、缺2；LoomGoStudio/P3、NngGoods/P5、PearlsTreasuresArt/P4、StellaGoodsGifts/P1各缺1。** 今早发布进一步形成缺口，尚未补齐，等待后续受控补货，日报不触发补货。

Chtte最近现场7件成品坐垫ID全部已知，不能重复使用；P3仍为mydecorshop的Kitchen & Dining 499618221101215211、Chair Cushions & Seat Pads，旧布料4325858718不可用，P1/P3不共用商品ID。HibiChStudio最近现场16件中符合Wall & Door Organizers的7件均已知，其余袋、箱、衣物罩不扩大分类入队。

首次缺口跟进状态仍completed：10月23日首次2条已有真实入库、ready/snapshot及实际零新增重跑证据，属于历史闭环，不计本日12条，也不代表长期补货结束。

### 当前全部路线库存

核验时点30店铺、32路线，usable合计88、deficit合计9；每路线target仍为3。下表为当前库存，不是每日新增数。

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
| P1 | KorusStore | 3 | 0 |
| P1 | MiraKiuStudio | 3 | 0 |
| P1 | NiceCraftStudioHK | 3 | 0 |
| P1 | Parkermo | 3 | 0 |
| P1 | ShirieHomeShow | 3 | 0 |
| P1 | SobiaStudio | 3 | 0 |
| P1 | StellaGoodsGifts | 2 | 1 |
| P1 | TunaMunStudio | 3 | 0 |
| P1 | WOGOL | 4 | 0 |
| P2 | Adamideal | 3 | 0 |
| P2 | HibiChStudio | 1 | 2 |
| P2 | KoltCraftStudio | 3 | 0 |
| P2 | LambertHouse | 3 | 0 |
| P2 | MiawoodStudio | 3 | 0 |
| P2 | WoodHomeLiang | 3 | 0 |
| P3 | CellaHo | 3 | 0 |
| P3 | Chtte | 0 | 3 |
| P3 | LoomGoStudio | 2 | 1 |
| P4 | ChicDecorHK | 3 | 0 |
| P4 | PearlsTreasuresArt | 2 | 1 |
| P4 | QuGifts | 3 | 0 |
| P5 | NinaJiaStudio | 3 | 0 |
| P5 | NngGoods | 2 | 1 |

相邻日报核验值对账：**90 + 本区间入库12 − 本区间发布14 = 88**。90为上次日报实际核验时点库存，不冒充精确截止快照。

### 未发布、失败、修复与证据边界

- 当前88条ready/scheduled储备均通过来源、配置及snapshot核验；当前未完成发布attempt为0、队列paused/failed合计0。不能据此推断全天从无瞬时异常。
- 发布调度仍启用；既有审核、每店铺每日1条、24小时间隔、账号间隔及发布窗口保持原样。ready不代表立即可发布。
- 最新已读发布[run40598631073/job122520836665](https://github.com/Sailin09/Store-Promotion/actions/runs/40598631073/job/122520836665)，北京时间10月28日06:57实际返回outside_publish_window、idle、published=0，该次没有新增Pin。14条发布由完整历史证明，不能用workflow success、HTTP200或idle代替。
- 调度查询仅最近20条HTTP、最近10条cron，**全区间每次请求和短暂失败覆盖不完整，未确认**。截止后的10:00请求在本次日志中仍待完成，不计为成功或失败；未触发额外发布。
- 本日报没有执行业务修复；区间内已完成两轮补货及两次幂等验证，未解决的是上述9条缺口。平台推送发送及设备实际收到仍未确认，聊天正文可见不等于设备收到。
- 按标题搜索读取[历史发布复核Issue #3](https://github.com/Sailin09/Store-Promotion/issues/3)：数据快照为10月23日21:35，报告到UTC17:57才生成，约延迟4小时22分。首段113混入后续库存，不能当作21:35库存或本日报基线。

### 数据来源与双端投递

本次通过GitHub连接器读取最新main证据目录、两个区间batch、四份cloud-run、first-deficit-followup.json、云端说明、发布/补货工作流与实际日志、Issue #2正文及全部26条既有评论，并按标题搜索发布复核Issue。未发现本日唯一标记，使用本日单条评论，保留其他日期历史。

[本次重新执行的只读Verify：run40550006641/job122587396278](https://github.com/Sailin09/Store-Promotion/actions/runs/40550006641/job/122587396278)。daily_history查询无LIMIT，从北京时间10月27日00:00起返回全部19条历史，覆盖完整区间；按真实时间筛出14条，全部关联到商品/店铺，无重复Pin。完整日志254592字符。当前库存与储备亦来自此次新核验。

[完整日报存档](https://github.com/Sailin09/Store-Promotion/blob/main/operations/replenishment/daily-report-2026-10-28.md) · [配套证据](https://github.com/Sailin09/Store-Promotion/blob/main/operations/replenishment/daily-report-2026-10-28.json)。同一完整正文用于本聊天与Issue #2当日唯一评论，评论和存档将读回核对；聊天最终正文仍待独立读回，平台通知及设备送达保持未确认。