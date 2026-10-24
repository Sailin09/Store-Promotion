# 执行日报 2026-10-24
<!-- store-promotion-daily:2026-10-24 -->

统计区间：北京时间 **2026-10-23 10:00（含）—2026-10-24 10:00（不含）**，即UTC02:00—次日02:00。补跑核验时间：北京时间 **2026-10-24 11:51:14**；晚于逻辑截止约1小时51分。以下“区间新增”严格按真实published_at和入库日志时间统计；最新库存另标时点。未以历史累计62条作为每日基线。

区间真实新增 **10条Pin（五账号各2条）**；真实新增审核素材 **56件**，其中白天库存准备54件、昨晚发布后首次云端补货2件。最新库存104条、缺口7条；截止10:00时库存重建为108条、缺口4条。未将待下一周期处理的缺口写成已补齐。本次只读业务数据，没有触发发布或补货。

## 五账号发布

| 账号 | 昨晚21:00—23:00 | 今早08:00—10:00 | 区间合计 |
|---|---:|---:|---:|
| P1 icyndizhang | 1 | 1 | 2 |
| P2 sailing_981 | 1 | 1 | 2 |
| P3 mydecorshop | 1 | 1 | 2 |
| P4 cindyzhang62 | 1 | 1 | 2 |
| P5 ivy5205 | 1 | 1 | 2 |

**昨晚北京时间21:00—23:00：**

| 账号 | 北京时间 | 店铺／Etsy商品 | 实际Pin |
|---|---|---|---|
| P1 icyndizhang | 2026-10-23 21:00:04 | GavinHome／[1306867898](https://www.etsy.com/listing/1306867898) | [801218590009451820](https://www.pinterest.com/pin/801218590009451820/) |
| P3 mydecorshop | 2026-10-23 21:05:02 | CellaHo／[1832656370](https://www.etsy.com/listing/1832656370) | [499618152434239638](https://www.pinterest.com/pin/499618152434239638/) |
| P2 sailing_981 | 2026-10-23 21:10:03 | MiawoodStudio／[1302262396](https://www.etsy.com/listing/1302262396) | [863494928599260395](https://www.pinterest.com/pin/863494928599260395/) |
| P4 cindyzhang62 | 2026-10-23 21:15:03 | ChicDecorHK／[1721799800](https://www.etsy.com/listing/1721799800) | [675399275414548848](https://www.pinterest.com/pin/675399275414548848/) |
| P5 ivy5205 | 2026-10-23 21:20:02 | NinaJiaStudio／[4568703716](https://www.etsy.com/listing/4568703716) | [713820609737581186](https://www.pinterest.com/pin/713820609737581186/) |

**今早截止10:00前：**

| 账号 | 北京时间 | 店铺／Etsy商品 | 实际Pin |
|---|---|---|---|
| P1 icyndizhang | 2026-10-24 08:00:03 | AmyHomeCrafts／[4365683163](https://www.etsy.com/listing/4365683163) | [801218590009461356](https://www.pinterest.com/pin/801218590009461356/) |
| P2 sailing_981 | 2026-10-24 08:05:02 | WoodHomeLiang／[1698517856](https://www.etsy.com/listing/1698517856) | [863494928599268340](https://www.pinterest.com/pin/863494928599268340/) |
| P4 cindyzhang62 | 2026-10-24 08:10:02 | PearlsTreasuresArt／[4339516931](https://www.etsy.com/listing/4339516931) | [675399275414558248](https://www.pinterest.com/pin/675399275414558248/) |
| P5 ivy5205 | 2026-10-24 08:15:02 | NngGoods／[4571794029](https://www.etsy.com/listing/4571794029) | [713820609737590168](https://www.pinterest.com/pin/713820609737590168/) |
| P3 mydecorshop | 2026-10-24 08:20:02 | LoomGoStudio／[4498616976](https://www.etsy.com/listing/4498616976) | [499618152434244058](https://www.pinterest.com/pin/499618152434244058/) |

**截止后事件，不计入上述10条：**

| 账号 | 北京时间 | 店铺／Etsy商品 | 实际Pin |
|---|---|---|---|
| P1 icyndizhang | 2026-10-24 10:05:02 | beou／[1341529845](https://www.etsy.com/listing/1341529845) | [801218590009462489](https://www.pinterest.com/pin/801218590009462489/) |
| P2 sailing_981 | 2026-10-24 10:10:02 | LambertHouse／[1790815391](https://www.etsy.com/listing/1790815391) | [863494928599269339](https://www.pinterest.com/pin/863494928599269339/) |
| P4 cindyzhang62 | 2026-10-24 10:15:02 | QuGifts／[1843847088](https://www.etsy.com/listing/1843847088) | [675399275414559572](https://www.pinterest.com/pin/675399275414559572/) |
| P3 mydecorshop | 2026-10-24 10:25:02 | Chtte／[4440831933](https://www.etsy.com/listing/4440831933) | [499618152434244647](https://www.pinterest.com/pin/499618152434244647/) |

P5截止后未发现新增Pin。区间和截止后Pin均由数据库publish_history无LIMIT查询核验，按唯一Pin ID去重，状态均为published；不是按工作流success或HTTP200推断。完整读取243,677字符verify日志，未截取最后20条。商品关联由同次队列／历史记录与店铺登记关系核对，14条均已匹配店铺和商品。最新open_attempt查询返回0行，未发现prepared/dispatched/uncertain未决尝试。

## 区间补货和防重复

以下56件是区间内**实际inserted**的全清单，非全量历史库存。前54件发生在10月23日中午至下午，属于已有审核库存准备；最后2件才是昨晚发布消耗后出现真实缺口的首轮纯云端补货。每件源图URL、来源说明、原checked_at及visual_verified证据保存在对应批次和本日报JSON；本次未重新核验商品或刷新时间。

路线代码为下列精确账号／Board映射：

| 代码 | 账号／handle | Board名称 | Board ID |
|---|---|---|---|
| A | P1 icyndizhang | CyndiZhangStudio | 801218658646993070 |
| B | P2 sailing_981 | storage | 863494997243989843 |
| C | P3 mydecorshop | Home Decor | 499618221101238533 |
| D | P3 mydecorshop | Kitchen & Dining | 499618221101215211 |
| E | P5 ivy5205 | Furniture | 713820678377803412 |

下表状态和snapshot_matches取自11:51数据库核验；原核验时间全部为2026-10-23 UTC。入库当时56件均ready且快照匹配；当前54件ready、2件published。其中LoomGoStudio 4498616976在区间内发布，Chtte 4440831933于截止后10:25发布，不能把当前状态回填成10:00状态。

### 白天库存准备：54件

| 店铺 | Etsy商品／listing_id | 路线 | queue_id | 当前状态 | 快照匹配 | 原核验时间（UTC） |
|---|---|---|---|---|---|---|
| NngGoods | [4537687983](https://www.etsy.com/listing/4537687983/natural-stone-cabinet-knob-blue-or-green) | E | `b946b2f4-217f-4c7e-ba7a-5eacad948588` | ready | true | 03:59:35 |
| NiceCraftStudioHK | [1462865996](https://www.etsy.com/listing/1462865996/floral-embroidered-sheer-curtain-elegant) | A | `3fbbc427-5a2f-4430-a523-36aca9e24ba7` | ready | true | 05:59:54 |
| HibiChStudio | [4454342176](https://www.etsy.com/listing/4454342176/fabric-hanging-organizer-wall-door) | B | `609b6f35-9007-4fb6-9d08-6f1dedc7c83c` | ready | true | 05:59:54 |
| LoomGoStudio | [4498616976](https://www.etsy.com/listing/4498616976/peony-jacquard-organza-fabric-sheer) | C | `079a1b00-422c-4ea7-92bc-474d11d3575a` | published | true | 05:59:54 |
| NiceCraftStudioHK | [4360340090](https://www.etsy.com/listing/4360340090/floral-embroidered-cotton-kitchen) | A | `d355ca2c-77be-4e02-8694-3f800f222307` | ready | true | 06:04:38 |
| NiceCraftStudioHK | [4355167342](https://www.etsy.com/listing/4355167342/white-embroidered-sheer-curtain-vintage) | A | `72f926b4-0184-4b29-9b21-9671528a474f` | ready | true | 06:04:38 |
| HibiChStudio | [4473098237](https://www.etsy.com/listing/4473098237/bedside-wall-hanging-organizer-over-door) | B | `521f6962-f9a5-4ccf-aed3-b5f04719ce22` | ready | true | 06:04:38 |
| HibiChStudio | [4391650576](https://www.etsy.com/listing/4391650576/cotton-wall-hanging-organizer-kids-room) | B | `fd39c848-6b7e-401d-9ca3-188dcb936fda` | ready | true | 06:04:38 |
| LoomGoStudio | [4498625218](https://www.etsy.com/listing/4498625218/6-momme-blossom-organza-fabric-silk) | C | `24a6f79b-14a6-48c2-aef2-b4dd7620a9c1` | ready | true | 06:04:38 |
| LoomGoStudio | [4498620868](https://www.etsy.com/listing/4498620868/hand-dyed-organza-fabric-tie-dye-silk) | C | `eda8db5d-b72d-4a2b-ab60-45c184636bf7` | ready | true | 06:04:38 |
| Chtte | [4440831933](https://www.etsy.com/listing/4440831933/nomira-oval-chair-cushion-cotton-linen) | D | `9f533103-a1df-4917-bfc4-e79394cfd3a0` | published | true | 06:31:01.519 |
| Chtte | [4514553651](https://www.etsy.com/listing/4514553651/u-shaped-chair-pad-linen-blend-seat) | D | `981da0c9-c340-4a21-bfaa-d9441379a4b0` | ready | true | 06:31:04.070 |
| Chtte | [4535436683](https://www.etsy.com/listing/4535436683/ushape-highdensity-sponge-chair-pad) | D | `6695cde2-8d20-4fbf-b1e5-02dff24013c0` | ready | true | 06:31:13.650 |
| Chtte | [4514589653](https://www.etsy.com/listing/4514589653/nonslip-chair-pad-dot-rubber-bottom-with) | A | `61946164-76a4-48af-9185-172a469c7a07` | ready | true | 06:31:16.132 |
| Chtte | [4535424416](https://www.etsy.com/listing/4535424416/u-shaped-linen-blend-chair-pad) | A | `1e3dbc99-7da4-45f1-bb90-3ef8b888e6ef` | ready | true | 06:31:18.799 |
| Adamideal | [4512140149](https://www.etsy.com/listing/4512140149/wood-desk-organizer-retractable-cable) | B | `bc8cf06b-e478-4031-9901-46506f19825a` | ready | true | 06:32:19.468 |
| Adamideal | [4364186500](https://www.etsy.com/listing/4364186500/vintage-wood-pen-holder-handmade-desk) | B | `a7b424c6-ba9b-4f27-9859-bb799204972b` | ready | true | 06:32:21.708 |
| AmyHomeCrafts | [4347288764](https://www.etsy.com/listing/4347288764/white-embroidered-cotton-kitchen-valance) | A | `ae92b8e9-87d5-43ab-b31e-4ded149ed759` | ready | true | 06:32:37.948 |
| AmyHomeCrafts | [1527020795](https://www.etsy.com/listing/1527020795/white-lace-curtains-shabby-chic-floral) | A | `25c9977e-f1b0-4cea-97fb-12734a919bf4` | ready | true | 06:32:40.905 |
| beou | [1316301617](https://www.etsy.com/listing/1316301617/linen-cotton-blend-chair-cushion-with) | A | `b52854cf-8068-4378-a855-ae0062ca53bc` | ready | true | 06:32:55.042 |
| beou | [4516207914](https://www.etsy.com/listing/4516207914/striped-cotton-linen-chair-pad-dining) | A | `412f7670-d27b-4de8-a7e4-172069b43ef2` | ready | true | 06:32:57.709 |
| ChicDecorHK | [4450228164](https://www.etsy.com/listing/4450228164/classic-striped-linen-curtains-brown) | A | `8c240dd7-a6af-4ad5-829c-24ed2ca18f80` | ready | true | 06:33:14.325 |
| ChicDecorHK | [1734365992](https://www.etsy.com/listing/1734365992/linen-striped-roman-shade-sheer-manual) | A | `8929ce07-4d7b-4463-9ca6-a2f14b13639e` | ready | true | 06:33:17.136 |
| CustomCurtainsStudio | [1513221839](https://www.etsy.com/listing/1513221839/boho-crochet-curtain-farmhouse-knitted) | A | `55ed78d0-76b6-412d-81ea-5a33125715b2` | ready | true | 06:33:32.235 |
| CustomCurtainsStudio | [1795965612](https://www.etsy.com/listing/1795965612/embroidered-floral-tie-up-curtain) | A | `1980536b-680d-491a-80f3-56301120da5e` | ready | true | 06:33:34.641 |
| DanyHomeDesign | [1850503273](https://www.etsy.com/listing/1850503273/green-botanical-print-semi-blackout) | A | `1c11bca6-fc11-41d8-a792-6b1bfe965647` | ready | true | 06:33:47.546 |
| DanyHomeDesign | [1835846194](https://www.etsy.com/listing/1835846194/orange-botanical-jacquard-semi-blackout) | A | `3c192711-c779-4464-bb7a-06d606bfab0a` | ready | true | 06:33:50.549 |
| FrenchStyleDecor | [1640065065](https://www.etsy.com/listing/1640065065/white-cotton-lace-apron-adjustable) | A | `7cd4c7d9-55ce-4b95-978f-1a455d5cc87a` | ready | true | 06:34:21.537 |
| FrenchStyleDecor | [1688268594](https://www.etsy.com/listing/1688268594/embroidered-floral-pillowcase-cotton) | A | `64a65fe3-f3b5-4bcc-bc35-f8b2c5bb4c47` | ready | true | 06:34:24.160 |
| NngGoods | [4301773735](https://www.etsy.com/listing/4301773735/green-aventurine-brass-knob-vintage) | E | `556ef488-39f5-4bd2-9c56-f7d81e1980be` | ready | true | 06:34:33.470 |
| GavinHome | [1707732808](https://www.etsy.com/listing/1707732808/french-style-lace-curtain-embroidered) | A | `5275be81-40fd-484c-838f-abf35ec3a3c7` | ready | true | 06:36:12.073 |
| GavinHome | [1306489180](https://www.etsy.com/listing/1306489180/white-sheer-floral-lace-curtain-shabby) | A | `2532e622-85ae-45fc-8d4b-78678c3d362d` | ready | true | 06:36:15.240 |
| HeyDream | [1809228191](https://www.etsy.com/listing/1809228191/white-lace-sheer-curtains-floral-striped) | A | `19dde5b4-5658-4c36-8f63-0ed665834e20` | ready | true | 06:36:27.967 |
| HeyDream | [1784373740](https://www.etsy.com/listing/1784373740/vintage-white-embroidered-ruffle-throw) | A | `0b81049b-bc8d-4238-9fe9-76de985be2a3` | ready | true | 06:36:30.203 |
| KorusStore | [1341070659](https://www.etsy.com/listing/1341070659/deep-green-botanical-print-curtains) | A | `0569ee9e-ed2b-4104-82ec-6f4e1d2667ca` | ready | true | 06:36:44.468 |
| KorusStore | [1857527262](https://www.etsy.com/listing/1857527262/botanical-leaf-print-curtain-elegant) | A | `ef19761c-dcfe-4bf3-9485-5fbe3f137547` | ready | true | 06:36:46.852 |
| LambertHouse | [1790823175](https://www.etsy.com/listing/1790823175/aluminium-clothes-hangers-smooth-matte) | B | `7b08bb7e-13e4-4f37-b626-514a336cbbfd` | ready | true | 06:37:13.025 |
| LambertHouse | [4317015758](https://www.etsy.com/listing/4317015758/brown-wood-coat-hangers-non-slip-grips) | B | `d5fadbd3-5115-4eb3-97a2-53617967786e` | ready | true | 06:37:15.669 |
| MiawoodStudio | [1877234401](https://www.etsy.com/listing/1877234401/black-walnut-wood-hanger-with-black) | B | `0ab10707-11da-4736-88b1-c4cf8ab6af5a` | ready | true | 06:37:30.378 |
| MiawoodStudio | [1798068027](https://www.etsy.com/listing/1798068027/walnut-pants-hanger-with-brass-clips) | B | `b0052606-f4ea-412c-a60c-e5923c71d8d4` | ready | true | 06:37:33.014 |
| MiraKiuStudio | [4464847134](https://www.etsy.com/listing/4464847134/ivory-cotton-ruffle-half-apron-french) | A | `34345c33-591a-48a5-a656-c3e932b2870b` | ready | true | 06:37:57.385 |
| MiraKiuStudio | [4464842770](https://www.etsy.com/listing/4464842770/white-embroidered-apron-with-pocket) | A | `0de7ba75-1929-4973-b1df-2696d756af2e` | ready | true | 06:37:59.724 |
| Parkermo | [4388009902](https://www.etsy.com/listing/4388009902/yellow-plaid-kitchen-curtainfarmhouse) | A | `95f26552-ea2d-4491-91e5-b970de77dff6` | ready | true | 06:38:20.624 |
| Parkermo | [1857030803](https://www.etsy.com/listing/1857030803/blue-plaid-kitchen-cafe-curtain) | A | `4409e84d-3e34-4106-9765-076899020ce6` | ready | true | 06:38:23.260 |
| ShirieHomeShow | [1838608268](https://www.etsy.com/listing/1838608268/white-sheer-curtains-embroidered-green) | A | `e7dced93-9350-4398-b79c-c4e6abe7c750` | ready | true | 06:38:34.046 |
| ShirieHomeShow | [1902114323](https://www.etsy.com/listing/1902114323/birds-embroidered-sheer-curtain-white) | A | `1637f93d-8169-429c-ad52-4178d1184e73` | ready | true | 06:38:36.711 |
| SobiaStudio | [4301845181](https://www.etsy.com/listing/4301845181/rose-floral-curtain-shabby-chic-window) | A | `4093bd75-d4fe-4bf8-aef9-254c632ca24d` | ready | true | 06:38:49.688 |
| SobiaStudio | [4363478666](https://www.etsy.com/listing/4363478666/rose-floral-cafe-curtain-farmhouse-short) | A | `7a6a26a3-a7ff-43a6-92f2-6ee20bcfc4cb` | ready | true | 06:38:51.957 |
| StellaGoodsGifts | [4341667363](https://www.etsy.com/listing/4341667363/square-throw-pillow-case-orchid-pattern) | A | `40d0393d-3518-4706-ac6a-13f50355908f` | ready | true | 06:39:06.779 |
| StellaGoodsGifts | [4579450601](https://www.etsy.com/listing/4579450601/asian-landscape-velvet-lumbar-pillow) | A | `dfe015bb-1efd-4305-96c4-ddc136aaef2a` | ready | true | 06:39:09.440 |
| TunaMunStudio | [4538560615](https://www.etsy.com/listing/4538560615/farmhouse-tier-curtain-floral-vanity) | A | `c28fd647-1832-4989-9641-005679457194` | ready | true | 06:39:29.149 |
| TunaMunStudio | [4548402554](https://www.etsy.com/listing/4548402554/floral-linen-texture-sink-skirt-curtain) | A | `9279aa36-25d0-41a8-83ca-b16a9cb5f666` | ready | true | 06:39:31.829 |
| WoodHomeLiang | [1375376543](https://www.etsy.com/listing/1375376543/rustic-wood-clothes-hangers-minimalist) | B | `efc29ec6-762a-486a-8447-cd7322142d22` | ready | true | 06:39:45.680 |
| WoodHomeLiang | [1342461246](https://www.etsy.com/listing/1342461246/natural-wood-floating-clothes-rack-wall) | B | `efd32e54-e248-4591-97e5-3371545d1da1` | ready | true | 06:39:48.163 |

### 昨晚发布后首轮纯云端补货：2件

13:48 UTC现场查询111条可用、2条缺口：GavinHome/P1、MiawoodStudio/P2各1；仅补这两条。详情卖家、在售选项、Add to cart及实际主图均在云端浏览器核验；工作流另复核公开Board归属和原图。13:51 UTC入库2件、失败0，实际重跑新增0；独立数据库核验113条、缺口0。

| 店铺 | Etsy商品／listing_id | 路线 | queue_id | 当前状态 | 快照匹配 | 原核验时间（UTC） |
|---|---|---|---|---|---|---|
| GavinHome | [1588948144](https://www.etsy.com/listing/1588948144/embroidered-lace-sheer-curtain-french) | A | `636f5127-1a35-4fef-8ba7-1a98ab69ae41` | ready | true | 13:50:35.657 |
| MiawoodStudio | [1876737077](https://www.etsy.com/listing/1876737077/solid-wood-clothes-hangers-elegant) | B | `c8e5f580-30c5-460b-8d29-191f63d35bbb` | ready | true | 13:50:35.657 |

**每轮实际入库及幂等证据：**

| 北京时间10月23日 | 来源／批次 | 首次inserted | 实际重跑inserted | failed | 运行／job |
|---|---|---:|---:|---:|---|
| 12:11 | materials-2026-10-23-b15（NngGoods单件） | 1 | 0 | 0 | [39898992604](https://github.com/Sailin09/Store-Promotion/actions/runs/39898992604)／120235934611 |
| 14:02 | batch-055954 | 3 | 0 | 0 | [39909016094](https://github.com/Sailin09/Store-Promotion/actions/runs/39909016094)／120267558873 |
| 14:06 | batch-060438 | 6 | 0 | 0 | [39909457776](https://github.com/Sailin09/Store-Promotion/actions/runs/39909457776)／120268934504 |
| 14:36 | batch-063433 | 20 | 0 | 0 | [39912470358](https://github.com/Sailin09/Store-Promotion/actions/runs/39912470358)／120278492798 |
| 14:41—14:42 | batch-063948a/b | 24 | 0 | 0 | [39913014973](https://github.com/Sailin09/Store-Promotion/actions/runs/39913014973)／120280224573 |
| 21:51 | batch-135035，首次发布后纯云端补货 | 2 | 0 | 0 | [39964575258](https://github.com/Sailin09/Store-Promotion/actions/runs/39964575258)／120451191812 |
| 合计 | 唯一listing_id共56件 | 56 | 0 | 0 | 无重复新增 |

另两次旧单件批次执行（UTC06:03、07:19）均首次0、重跑0、skipped_existing=1；没有再计为补货。对应运行39909209997、39916988722。39898790282的review被skipped，也不计成功。历史GitHub runner商品探测曾遇挑战／失败，不等于当前云端详情核验失败，不能把这类工作流状态算入入库数量。

**之后各轮：** 北京时间10月23日19:18，库存116／缺口0／入队0（发布前）；10月24日01:20与07:14，库存113／缺口0／入队0。均按零缺口停止，不为演示超target=3；这些轮次没有发生新增入库。首次额外跟进状态已completed，长期补货继续。本日报没有额外触发入库。未入库候选不计成功。

## 库存、时点及待处理

| 数据时点（北京） | 可用库存 | 缺口 | 说明 |
|---|---:|---:|---|
| 10月23日21:35快照附近 | 111 | 2 | 五账号各发布1条后；与21:48只读核验一致。Issue #3首段113混入后续时点，不照抄为21:35库存 |
| 10月23日21:51补货复核 | 113 | 0 | 新增2件后的真实库存 |
| 10月24日09:35:42 | 108 | 4 | Issue #2评论6378244850现场记录 |
| 10月24日10:00逻辑截止 | 108 | 4 | 由09:35记录及完整历史/补货日志重建；09:35—10:00无新增Pin或入库记录，非精确10:00数据库快照 |
| 10月24日11:51:14最新核验 | 104 | 7 | 截止后另发布4条；其中P4路线仍高于target，故缺口只增加3 |

**最新32路线明细，target均为3：**

| 店铺 | 账号 | 可用 | 缺口 |
|---|---|---:|---:|
| AmyHomeCrafts | P1 | 2 | 1 |
| beou | P1 | 2 | 1 |
| Chtte | P3 | 2 | 1 |
| LambertHouse | P2 | 2 | 1 |
| LoomGoStudio | P3 | 2 | 1 |
| NngGoods | P5 | 2 | 1 |
| WoodHomeLiang | P2 | 2 | 1 |
| Adamideal | P2 | 3 | 0 |
| ChicDecorHK | P1 | 3 | 0 |
| Chtte | P1 | 3 | 0 |
| CustomCurtainsStudio | P1 | 3 | 0 |
| DanyHomeDesign | P1 | 3 | 0 |
| FrenchStyleDecor | P1 | 3 | 0 |
| GavinHome | P1 | 3 | 0 |
| HeyDream | P1 | 3 | 0 |
| HibiChStudio | P2 | 3 | 0 |
| KorusStore | P1 | 3 | 0 |
| MiawoodStudio | P2 | 3 | 0 |
| MiraKiuStudio | P1 | 3 | 0 |
| NiceCraftStudioHK | P1 | 3 | 0 |
| Parkermo | P1 | 3 | 0 |
| ShirieHomeShow | P1 | 3 | 0 |
| SobiaStudio | P1 | 3 | 0 |
| StellaGoodsGifts | P1 | 3 | 0 |
| TunaMunStudio | P1 | 3 | 0 |
| CellaHo | P3 | 5 | 0 |
| KoltCraftStudio | P2 | 5 | 0 |
| NinaJiaStudio | P5 | 5 | 0 |
| PearlsTreasuresArt | P4 | 5 | 0 |
| QuGifts | P4 | 5 | 0 |
| WOGOL | P1 | 5 | 0 |
| ChicDecorHK | P4 | 6 | 0 |

10:00截止时待补：AmyHomeCrafts/P1、WoodHomeLiang/P2、LoomGoStudio/P3、NngGoods/P5各1。11:51另增加beou/P1、LambertHouse/P2、Chtte/P3各1，共7条，正常保留给既有补货周期；未提前补齐、未制造缺口。

**未发布及原因：** 当前104件可用素材仍待发布；五账号均active、OAuth已连接，发布设置enabled。发布窗口为北京时间08:00—11:00及21:00—23:00，账号最小间隔2小时，仍受店铺24小时等审核限频约束。不能把全部待发布素材说成失败，也不能为加快日报而触发发布。另有draft：P1 55条（有图0）、P2 26条（有图0）、P3 4条（有图3），P4/P5各0；draft尚未达到发布就绪条件，不计可用审核库存。单条未就绪的全部原因未做独立诊断，标未确认。最新未决发布尝试0，未见本区间需重置的失败记录。

## 已修正与未解决

- 已完成昨晚首次真实缺口补货闭环：2条ready／snapshot=true，实际重跑0，证据保留，未动发布去重或审核门槛。
- 日报已按完整publish_history时间范围查询，分离区间与截止后事件，列齐56件入库，不把54件白天库存准备称为昨晚自动补货。
- [Issue #3](https://github.com/Sailin09/Store-Promotion/issues/3)记录的21:35数据快照与报告生成须分开：报告运行于UTC17:57才开始，约滞后4小时22分，实际投递更晚；快照时间未因此被改写。其首段库存113来自后续时点，日报已明确纠正，但没有覆盖原Issue历史。
- 最新7条缺口尚未补货；本日报只读，不代替既有补货任务。历史cloud-operations文档仍含首次闭环未验证的旧说明，以first-deficit-followup.json及实际入库核验为准。
- 本轮只重跑只读verify，不发布、不补货、不清空历史、不放宽审核。

## 核验和投递依据

[最新只读Verify](https://github.com/Sailin09/Store-Promotion/actions/runs/39964697818)本次attempt 4、job120771174640；完整publish_history区间查询无LIMIT，源SQL覆盖本区间且额外返回截止后4条。库存审计时间UTC03:51:14。已读取Issue #2全部现有评论、发布复核Issue #3、全部区间批次及上述6轮真实入库日志、后续零入队证据。来源批次在operations/replenishment/及operations/materials-2026-10-23-b15.json，完整记录在daily-report-2026-10-24.json。

投递：Issue #2当日唯一标记评论已写入并读回比对；此相同完整正文通过本次最终响应输出到任务聊天。平台聊天delivery_status尚未提供确认，记为unknown，不能把“运行完成”写成已确认通知送达。无任何用户API key被请求或写入。