# 执行日报 2026-10-27

<!-- store-promotion-daily:2026-10-27 -->

统计区间：**北京时间2026-10-26 10:00（含）至2026-10-27 10:00（不含）**，即UTC 2026-10-26 02:00至2026-10-27 02:00，续接上次成功日报截止。

实际数据库核验时间：**2026-10-27 10:00:18.858 北京时间**（UTC 2026-10-27T02:00:18.85851+00:00），在逻辑截止后约19秒取数；正文整理时间为北京时间10:01后。当前库存为该核验时点值，新增按真实published_at和queue.created_at筛选。截止后至核验时点未发现新增Pin，后续事件不计入本区间。

本区间确认**实际新增Pin 14条、补货入库8条**；两轮分别入库5条和3条，实际幂等重跑均inserted=0。当前**90条可用库存、8条缺口**，缺口尚未补齐。本日报仅只读业务核验，未触发发布、补货、入队或业务修复。

### 逐账号汇总

| 账号 | 区间新增Pin | 当前可用 | 缺口（target=3） | 草稿 / 有图草稿 |
|---|---|---|---|---|
| P1 icyndizhang | 3 | 55 | 1 | 55 / 0 |
| P2 sailing_981 | 3 | 16 | 2 | 26 / 0 |
| P3 mydecorshop | 3 | 6 | 3 | 4 / 3 |
| P4 cindyzhang62 | 3 | 8 | 1 | 0 / 0 |
| P5 ivy5205 | 2 | 5 | 1 | 0 / 0 |

五账号均active、OAuth已连接。草稿不计已审核库存，也不计发布成功。P5本区间确认2条，其他账号各3条；未发现P5第三条区间记录，具体未触发原因未确认，不能仅凭数量较少认定失败。

### P1 · icyndizhang：新增3条

| 北京时间 | 店铺 / Etsy商品 | 实际Pin |
|---|---|---|
| 2026-10-26 10:05:02 | SobiaStudio [4366214891](https://www.etsy.com/listing/4366214891) | [801218590009499644](https://www.pinterest.com/pin/801218590009499644/) |
| 2026-10-26 21:00:03 | MiraKiuStudio [4385581970](https://www.etsy.com/listing/4385581970) | [801218590009506603](https://www.pinterest.com/pin/801218590009506603/) |
| 2026-10-27 08:00:03 | ShirieHomeShow [4299980520](https://www.etsy.com/listing/4299980520) | [801218590009516196](https://www.pinterest.com/pin/801218590009516196/) |

### P2 · sailing_981：新增3条

| 北京时间 | 店铺 / Etsy商品 | 实际Pin |
|---|---|---|
| 2026-10-26 10:10:02 | Adamideal [4512140149](https://www.etsy.com/listing/4512140149) | [863494928599301788](https://www.pinterest.com/pin/863494928599301788/) |
| 2026-10-26 21:05:02 | HibiChStudio [4473098237](https://www.etsy.com/listing/4473098237) | [863494928599308222](https://www.pinterest.com/pin/863494928599308222/) |
| 2026-10-27 08:05:01 | LambertHouse [4317015758](https://www.etsy.com/listing/4317015758) | [863494928599317224](https://www.pinterest.com/pin/863494928599317224/) |

### P3 · mydecorshop：新增3条

| 北京时间 | 店铺 / Etsy商品 | 实际Pin |
|---|---|---|
| 2026-10-26 10:35:02 | Chtte [4535436683](https://www.etsy.com/listing/4535436683) | [499618152434259343](https://www.pinterest.com/pin/499618152434259343/) |
| 2026-10-26 21:15:02 | CellaHo [4367385017](https://www.etsy.com/listing/4367385017) | [499618152434261692](https://www.pinterest.com/pin/499618152434261692/) |
| 2026-10-27 08:35:01 | LoomGoStudio [4498613403](https://www.etsy.com/listing/4498613403) | [499618152434266428](https://www.pinterest.com/pin/499618152434266428/) |

### P4 · cindyzhang62：新增3条

| 北京时间 | 店铺 / Etsy商品 | 实际Pin |
|---|---|---|
| 2026-10-26 10:25:02 | QuGifts [4549033180](https://www.etsy.com/listing/4549033180) | [675399275414597849](https://www.pinterest.com/pin/675399275414597849/) |
| 2026-10-26 21:30:02 | ChicDecorHK [1506048129](https://www.etsy.com/listing/1506048129) | [675399275414605031](https://www.pinterest.com/pin/675399275414605031/) |
| 2026-10-27 08:25:02 | PearlsTreasuresArt [1895005417](https://www.etsy.com/listing/1895005417) | [675399275414613395](https://www.pinterest.com/pin/675399275414613395/) |

### P5 · ivy5205：新增2条

| 北京时间 | 店铺 / Etsy商品 | 实际Pin |
|---|---|---|
| 2026-10-26 21:35:02 | NinaJiaStudio [4477926256](https://www.etsy.com/listing/4477926256) | [713820609737633176](https://www.pinterest.com/pin/713820609737633176/) |
| 2026-10-27 08:27:22 | NngGoods [4301771190](https://www.etsy.com/listing/4301771190) | [713820609737643340](https://www.pinterest.com/pin/713820609737643340/) |

以上14个Pin ID唯一，均有完整publish_history的published记录，且通过已审核publication行及商品ID关联到店铺。昨日北京时间21:00–23:00窗口为上述10月26日21时5条；今早08时5条、昨日10时4条也属于本区间。今日P5实际发布时间为08:27:22，按真实时间记录，不套用预设分钟。

### 区间全部真实补货：8条

下列8个唯一queue_id的created_at全部在统计区间内。核验时均为**ready / snapshot_matches=true / source_matches=true / eligible_configuration=true**，尚未发布；入库成功不等于Pin发布成功。

| 店铺 / Etsy商品 | 账号 | Board名称 / ID | queue_id | 入库北京时间 | 状态 / snapshot |
|---|---|---|---|---|---|
| Adamideal [4528768933](https://www.etsy.com/listing/4528768933/wood-phone-tablet-stand-adjustable) | P2 sailing_981 | storage / 863494997243989843 | 284d8b5b-3338-46a6-838e-c3a1f2da01d1 | 2026-10-26 13:19:53 | ready / true |
| KorusStore [1857527976](https://www.etsy.com/listing/1857527976/floral-print-curtain-vibrant-colorful) | P1 icyndizhang | CyndiZhangStudio / 801218658646993070 | e597086c-cf97-4961-b278-8708f55c17d2 | 2026-10-26 13:19:55 | ready / true |
| LoomGoStudio [4442580418](https://www.etsy.com/listing/4442580418/pink-chinese-silk-fabric-classic) | P3 mydecorshop | Home Decor / 499618221101238533 | 7920f1b8-bdab-42f2-bb3c-3fba75d5a33e | 2026-10-26 13:19:57 | ready / true |
| NngGoods [4301763578](https://www.etsy.com/listing/4301763578/marble-brass-pendant-cabinet-knob) | P5 ivy5205 | Furniture / 713820678377803412 | 1ae8f9b8-2328-4ed9-82cb-6352ba8c2349 | 2026-10-26 13:20:00 | ready / true |
| SobiaStudio [4310547220](https://www.etsy.com/listing/4310547220/floral-ruffle-curtain-cottage-rose-print) | P1 icyndizhang | CyndiZhangStudio / 801218658646993070 | ed1360c5-1672-43e1-a385-3d4a651f0d2f | 2026-10-26 13:20:01 | ready / true |
| CellaHo [1839625072](https://www.etsy.com/listing/1839625072/sky-blue-cotton-fabric-embroidered-daisy) | P3 mydecorshop | Home Decor / 499618221101238533 | 8bf4bde7-1785-4e50-8501-ea1c10429bac | 2026-10-27 01:24:03 | ready / true |
| MiraKiuStudio [4465201641](https://www.etsy.com/listing/4465201641/vintage-white-lace-apron-floral) | P1 icyndizhang | CyndiZhangStudio / 801218658646993070 | 4c871132-1c94-4f44-8ac6-a2ec27527402 | 2026-10-27 01:24:05 | ready / true |
| NinaJiaStudio [4435963114](https://www.etsy.com/listing/4435963114/colorful-plaid-makeup-bag-large-travel) | P5 ivy5205 | 名称未确认 / 713820678377803445 | f1689db3-45bc-4cdf-b3c0-ef846d3f1c11 | 2026-10-27 01:24:06 | ready / true |

NinaJiaStudio沿用既有P5 Board ID 713820678377803445，入库工作流已实时复核其账号归属；证据未提供Board名称，保持未确认，没有猜名或改映射。

**第一轮：北京时间10月26日13:19–13:20，新增5条。** [批次051853](https://github.com/Sailin09/Store-Promotion/blob/main/operations/replenishment/batch-20261026-051853.json)；[实际入库及重跑run40273561625/job121411543904](https://github.com/Sailin09/Store-Promotion/actions/runs/40273561625/job/121411543904)：首次inserted=5、failed=0、pending=5，第二次实际执行no_new_verified_material、inserted=0。库存92→97，缺口7→2。

**第二轮：北京时间10月27日01:24，新增3条。** [批次172255](https://github.com/Sailin09/Store-Promotion/blob/main/operations/replenishment/batch-20261026-172255.json)；[实际入库及重跑run40368106881/job121731417537](https://github.com/Sailin09/Store-Promotion/actions/runs/40368106881/job/121731417537)：首次inserted=3、failed=0、pending=3，第二次实际执行no_new_verified_material、inserted=0。库存92→95，缺口6→3。

本日报已重新读取两轮真实job日志，累计实际新增8条、失败0条，实际防重复重跑均为0；没有重复计算历史全量批次或10月23日首次两条。

**来源与实际视觉核验**：8条均来自对应登记店铺当时的当前storefront，先排除known_listing_ids，再核验真实详情卖家、在售规格及Add to cart，并实际查看云端CDP主图截图。以下为原始核验时间，本日报未浏览Etsy或刷新旧checked_at：

- **Adamideal / 4528768933**：北京时间2026-10-26 13:16:45。木质桌面支架，灰色防滑条、前托边、可调金属支臂和木底座；数量1，无尺寸/颜色变体。 分类：Desk Organization。[原图](https://i.etsystatic.com/35172699/r/il/622e5e/8362117348/il_794xN.8362117348_165h.jpg)。

- **KorusStore / 1857527976**：北京时间2026-10-26 13:17:17。浅底窗帘，粉红、洋红、橙色大花与深蓝绿色叶片；Rod Pocket、1PC W39×L59英寸。 分类：Floral Curtains。[原图](https://i.etsystatic.com/35854701/r/il/644642/6704789385/il_794xN.6704789385_b079.jpg)。

- **LoomGoStudio / 4442580418**：北京时间2026-10-26 13:17:46。粉紫色卷叠提花面料，红色亭阁和龙凤状纹样、金色线条；1 Yard，描述含抱枕和家居装饰用途，未宣称真丝纯度。 分类：Jacquard Fabric。[原图](https://i.etsystatic.com/58959935/r/il/ec7f21/7611259760/il_794xN.7611259760_kkgn.jpg)。

- **NngGoods / 4301763578**：北京时间2026-10-26 13:18:22。白柜门上的银色垂坠式拉手，白色带灰纹球形装饰；Howlite、1 PCS，未承诺天然石真实性。 分类：Cabinet Knobs & Pulls。[原图](https://i.etsystatic.com/57194200/r/il/f0c460/6843774322/il_794xN.6843774322_kmw8.jpg)。

- **SobiaStudio / 4310547220**：北京时间2026-10-26 13:18:53。浅色玫瑰花与绿叶窗帘，宽白色荷叶边；选择成品1PCS W49×L51英寸、Rod Pocket，并非廉价绑带选项。 分类：Floral Curtains。[原图](https://i.etsystatic.com/42208273/r/il/8c65cf/6955596899/il_794xN.6955596899_aiun.jpg)。

- **CellaHo / 1839625072**：北京时间2026-10-27 01:20:19。浅蓝折叠面料、白雏菊及绿茎叶刺绣；数量1，描述为半码单位且含家居用途，避开有矛盾的成分、幅宽等参数。 分类：Embroidered Fabric。[原图](https://i.etsystatic.com/39663062/r/il/f8ccbd/6544772212/il_794xN.6544772212_tjjs.jpg)。

- **MiraKiuStudio / 4465201641**：北京时间2026-10-27 01:21:27。模特穿白色花卉纹理围裙，宽荷叶边肩带、褶裙和口袋；数量1、无尺寸/颜色变体，页面库存5。 分类：Vintage Aprons。[原图](https://i.etsystatic.com/59152881/r/il/924b35/7882339433/il_794xN.7882339433_nqum.jpg)。

- **NinaJiaStudio / 4435963114**：北京时间2026-10-27 01:22:30。手持红绿黄蓝等彩色格纹拉链布包；Small、数量1，已加载选项及cart可用。 分类：Cosmetic Bags。[原图](https://i.etsystatic.com/61131894/r/il/e0f6d5/7579560280/il_794xN.7579560280_1al9.jpg)。

### 零入队轮次、候选及未解决事项

| 北京时间 / 记录 | 新增入队 | 当时库存 / 缺口 | 事实 |
|---|---|---|---|
| 10月26日19:18，[111854](https://github.com/Sailin09/Store-Promotion/blob/main/operations/replenishment/cloud-run-20261026-111854.json) | 0 | 97 / 2 | Chtte当前7个商品ID全部已知，未调用入库。 |
| 10月27日07:18，[231816](https://github.com/Sailin09/Store-Promotion/blob/main/operations/replenishment/cloud-run-20261026-231816.json) | 0 | 95 / 3 | Chtte及HibiChStudio符合既有分类的ID均已知，未调用入库。 |

这两轮没有新的入库幂等重跑，不能把零入队称为防重复验证成功。没有未入库候选被计入成功。HibiChStudio其他新ID为储物袋、箱或衣物罩等，未因库存缺口扩大既有Wall & Door Organizers分类。

当前缺口8条：Chtte/P3缺2；HibiChStudio/P2、LambertHouse/P2、LoomGoStudio/P3、NngGoods/P5、PearlsTreasuresArt/P4、ShirieHomeShow/P1各缺1。后5家在今早发布后形成缺口，**仍未补齐，等待后续受控补货**。Chtte不可用布料4325858718不复用，P3仍沿用mydecorshop的Kitchen & Dining 499618221101215211、Chair Cushions & Seat Pads路线。

首次缺口跟进保持completed：10月23日首次2条已有实际入库、ready/snapshot和真实零新增重跑证据；属于历史闭环，不计本区间8条，也不代表长期补货结束。

### 当前全部路线库存

核验时点为30店铺、32路线，usable合计90、deficit合计8，每路线target仍为3。下表为当前库存，不是每日新增数量。

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
| P1 | ShirieHomeShow | 2 | 1 |
| P1 | SobiaStudio | 3 | 0 |
| P1 | StellaGoodsGifts | 3 | 0 |
| P1 | TunaMunStudio | 3 | 0 |
| P1 | WOGOL | 5 | 0 |
| P2 | Adamideal | 3 | 0 |
| P2 | HibiChStudio | 2 | 1 |
| P2 | KoltCraftStudio | 3 | 0 |
| P2 | LambertHouse | 2 | 1 |
| P2 | MiawoodStudio | 3 | 0 |
| P2 | WoodHomeLiang | 3 | 0 |
| P3 | CellaHo | 3 | 0 |
| P3 | Chtte | 1 | 2 |
| P3 | LoomGoStudio | 2 | 1 |
| P4 | ChicDecorHK | 3 | 0 |
| P4 | PearlsTreasuresArt | 2 | 1 |
| P4 | QuGifts | 3 | 0 |
| P5 | NinaJiaStudio | 3 | 0 |
| P5 | NngGoods | 2 | 1 |

相邻日报核验值对账：**96 + 本区间入库8 − 本区间发布14 = 90**。96是上一日报实际核验时点值，不是精确截止快照，也没有使用历史累计62条作为日基线。

### 待发布、异常、修复与证据边界

- 当前90条ready/scheduled储备均通过来源、配置及snapshot核验；未完成发布attempt为0，当前队列paused/failed为0。区间14条publication行error为空，但不能据此推断全天从无短暂异常。
- 发布调度仍启用；每店铺每日1条、24小时间隔及账号/窗口门槛保持原样。ready不代表可以立即发布。
- 最新发布[run40426484973/job121933407477](https://github.com/Sailin09/Store-Promotion/actions/runs/40426484973/job/121933407477)实际在北京时间08:27返回P5 Pin 713820609737643340，随后idle；batch为published=1、jobs=2。该Pin已在P5表中计入一次，不能把后续idle当作整次未发布，也不能重复计数。
- 只读日志的HTTP请求仅最近20条、cron仅最近10条，**全区间每一次HTTP失败及瞬时错误覆盖不完整，未确认**。截止后10:00请求在核验时仍待完成，不计成功或失败；本日报未触发额外发布。
- 本日报没有执行业务修复。区间内两轮补货及两次幂等验证均完成；当前8条缺口仍未解决。平台推送发送及设备实际收到仍未确认，正文可见不能替代通知送达证明。
- 按标题搜索读到[历史发布复核Issue #3](https://github.com/Sailin09/Store-Promotion/issues/3)：数据快照为10月23日21:35，报告到UTC17:57才生成，约延迟4小时22分；首段库存113混入后续时点，不作为21:35库存或本日报基线。

### 数据来源与双端投递

本次已通过GitHub连接器读取最新main证据目录、区间两个batch与四份cloud-run、first-deficit-followup.json、云端运行说明、Issue #2正文及全部19条既有评论，并按标题搜索发布复核Issue。未发现今日唯一标记，采用本日单条评论，保留历史日期。

[本次重新执行的只读Verify：run40368275645/job121964208269](https://github.com/Sailin09/Store-Promotion/actions/runs/40368275645/job/121964208269)。daily_history为无LIMIT查询，从北京时间10月26日00:00起返回全部19条，覆盖本次完整区间，按真实published_at筛出14条；全部与商品和店铺关联成功，无重复Pin。库存、储备和账号状态为同次只读核验，完整日志250037字符。

[完整日报存档](https://github.com/Sailin09/Store-Promotion/blob/main/operations/replenishment/daily-report-2026-10-27.md) · [配套证据](https://github.com/Sailin09/Store-Promotion/blob/main/operations/replenishment/daily-report-2026-10-27.json)。本聊天最终响应与Issue #2当日评论使用同一完整正文，评论与仓库正文读回核对；聊天正文仍待独立读回，平台通知和设备送达保持未确认。
