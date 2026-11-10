# 执行日报 2026-11-10

<!-- store-promotion-daily:2026-11-10 -->

**本期确认发布 13 条唯一 Pin，实际补货入库 12 条。** 核验时 32 条路线共有 **82 条可用素材、14 条缺口**，每条路线目标 3。与上一日报对账：83 + 12 − 13 = 82。

统计区间为北京时间 **11 月 9 日 10:00（含）至 11 月 10 日 10:00（不含）**，即 UTC 11 月 9 日 02:00 至 11 月 10 日 02:00。起点续接[上一份成功日报](https://github.com/Sailin09/Store-Promotion/issues/2#issuecomment-6730467239)。本次[只读核验](https://github.com/Sailin09/Store-Promotion/actions/runs/42664076437/job/129577310972)的数据库审计时点为 **11 月 10 日 10:00:15.321738（02:00:15.321738 UTC）**，较逻辑截止晚 **15.322 秒**。下表用北京时间，显示到秒；按数据库原始时间归期。

**Pinterest 实际发布**

P1 `icyndizhang` **3** 条；P2 `sailing_981` **3** 条；P3 `mydecorshop` **2** 条；P4 `cindyzhang62` **3** 条；P5 `ivy5205` **2** 条。数据库 `daily_history` 的查询范围覆盖完整区间，按真实 `published_at` 和 Pin ID 去重，再与审核队列及商品记录关联。

| 账号 | 发布时间 | 店铺 / Etsy 商品 | Pin |
|---|---|---|---|
| P1 | 11-09 10:05:04 | StellaGoodsGifts [4341667363](https://www.etsy.com/listing/4341667363) | [801218590009731185](https://www.pinterest.com/pin/801218590009731185/) |
| P2 | 11-09 10:10:03 | MiawoodStudio [1877312583](https://www.etsy.com/listing/1877312583) | [863494928599517820](https://www.pinterest.com/pin/863494928599517820/) |
| P3 | 11-09 10:30:03 | LoomGoStudio [4574333860](https://www.etsy.com/listing/4574333860) | [499618152434355266](https://www.pinterest.com/pin/499618152434355266/) |
| P4 | 11-09 10:40:02 | PearlsTreasuresArt [1851020981](https://www.etsy.com/listing/1851020981) | [675399275414826446](https://www.pinterest.com/pin/675399275414826446/) |
| P1 | 11-09 21:00:04 | TunaMunStudio [4538560615](https://www.etsy.com/listing/4538560615) | [801218590009738851](https://www.pinterest.com/pin/801218590009738851/) |
| P2 | 11-09 21:05:02 | KoltCraftStudio [1753487209](https://www.etsy.com/listing/1753487209) | [863494928599523361](https://www.pinterest.com/pin/863494928599523361/) |
| P4 | 11-09 21:40:03 | QuGifts [1859116379](https://www.etsy.com/listing/1859116379) | [675399275414832877](https://www.pinterest.com/pin/675399275414832877/) |
| P5 | 11-09 22:40:03 | NinaJiaStudio [4415221724](https://www.etsy.com/listing/4415221724) | [713820609737879371](https://www.pinterest.com/pin/713820609737879371/) |
| P1 | 11-10 08:00:03 | GavinHome [1588948144](https://www.etsy.com/listing/1588948144) | [801218590009748221](https://www.pinterest.com/pin/801218590009748221/) |
| P2 | 11-10 08:05:02 | WoodHomeLiang [1702135608](https://www.etsy.com/listing/1702135608) | [863494928599532653](https://www.pinterest.com/pin/863494928599532653/) |
| P3 | 11-10 08:30:02 | CellaHo [4432276600](https://www.etsy.com/listing/4432276600) | [499618152434361495](https://www.pinterest.com/pin/499618152434361495/) |
| P4 | 11-10 08:35:02 | ChicDecorHK [1736022367](https://www.etsy.com/listing/1736022367) | [675399275414841980](https://www.pinterest.com/pin/675399275414841980/) |
| P5 | 11-10 09:40:02 | NngGoods [4538050408](https://www.etsy.com/listing/4538050408) | [713820609737889511](https://www.pinterest.com/pin/713820609737889511/) |

**待发布及异常：** 核验时 P1/P2/P3/P4/P5 可用待发库存见下表，未见已审核队列处于失败、暂停或有错误码的记录。另有草稿 **55 / 26 / 4 / 0 / 0** 条，其中带图 **0 / 0 / 3 / 0 / 0**；草稿不计可用库存。最新[发布作业](https://github.com/Sailin09/Store-Promotion/actions/runs/42736654772/job/129567426061)返回 `idle`；两次较早作业明确为窗口外。调度器核验时启用；本次核验只输出最近 20 条调度请求，无法确认全区间逐次未发布或失败的原因，不能把 idle 当发布成功。[历史发布复核 Issue](https://github.com/Sailin09/Store-Promotion/issues/3)仅作历史核对，未用其累计值计算本期。

**Etsy 补货入库**

- 第一批实际入库 **9**，失败 **0**，实际幂等重跑新增 **0**：[入库及重跑日志](https://github.com/Sailin09/Store-Promotion/actions/runs/42567176871/job/128996239900) · [视觉核验证据](https://github.com/Sailin09/Store-Promotion/blob/main/operations/replenishment/cloud-run-20261109-051924.json)。
- 第二批实际入库 **3**，失败 **0**，实际幂等重跑新增 **0**：[入库及重跑日志](https://github.com/Sailin09/Store-Promotion/actions/runs/42663907298/job/129322566009) · [视觉核验证据](https://github.com/Sailin09/Store-Promotion/blob/main/operations/replenishment/cloud-run-20261109-172003.json)。

以下为按唯一 `queue_id` 核对的全部 12 条；本次数据库复核均为 `ready`、`snapshot_matches=true`。来源为表内 Etsy 详情页；视觉核验时间链接到当时查看的商品原图，两份证据记录了店面发现、卖家、在售选项、Add to cart 和截图所见。

| 店铺 / Etsy 商品 | 账号 | Board / ID | queue_id | 主图核验 | 实际入库 |
|---|---|---|---|---|---|
| CellaHo [4478515901](https://www.etsy.com/listing/4478515901/beige-floral-embroidered-cotton-fabric) | P3 | Home Decor `499618221101238533` | `7b3c0240-92aa-49c4-baf6-7f8402a6c0b3` | [11-09 13:23:57](https://i.etsystatic.com/39663062/r/il/900cbd/7895899727/il_794xN.7895899727_cmxy.jpg) | 11-09 13:25:47 |
| ChicDecorHK [1869942090](https://www.etsy.com/listing/1869942090/handmade-conch-shell-earrings-luminous) | P4 | Jewelry & Accessories `675399344058025061` | `e0dcf6fa-a5b2-468f-a0c3-18558f45d635` | [11-09 13:24:04](https://i.etsystatic.com/32003756/r/il/0a17bf/6709903711/il_794xN.6709903711_l914.jpg) | 11-09 13:25:49 |
| LambertHouse [4573171313](https://www.etsy.com/listing/4573171313/aluminum-clothes-hanger-set-1020pcs-non) | P2 | storage `863494997243989843` | `14639d90-d0d8-4280-9989-3c8923105cc1` | [11-09 13:24:11](https://i.etsystatic.com/46944744/r/il/e1640b/8507785394/il_794xN.8507785394_78ac.jpg) | 11-09 13:25:53 |
| LoomGoStudio [4474242681](https://www.etsy.com/listing/4474242681/silk-organza-fabric-by-yard-embroidered) | P3 | Home Decor `499618221101238533` | `5386163d-5a9d-4d05-b309-91da444e7bca` | [11-09 13:23:24](https://i.etsystatic.com/58959935/r/il/458237/7820240982/il_794xN.7820240982_edee.jpg) | 11-09 13:25:54 |
| MiawoodStudio [1877277501](https://www.etsy.com/listing/1877277501/wooden-clothes-hanger-with-metal-hook) | P2 | storage `863494997243989843` | `f5d9a14c-e616-4149-851b-93340adf03f8` | [11-09 13:23:29](https://i.etsystatic.com/32100253/r/il/622f44/6707948015/il_794xN.6707948015_2uki.jpg) | 11-09 13:25:55 |
| NngGoods [4537641050](https://www.etsy.com/listing/4537641050/natural-crystal-geode-cabinet-knob-druzy) | P5 | Furniture `713820678377803412` | `dfaa6e4b-a30f-458e-83ce-dc4d5ed4d335` | [11-09 13:23:34](https://i.etsystatic.com/57194200/r/il/ee776f/8429701848/il_794xN.8429701848_sih3.jpg) | 11-09 13:25:57 |
| PearlsTreasuresArt [1885304220](https://www.etsy.com/listing/1885304220/gold-trimmed-seashell-drop-earrings) | P4 | Jewelry & Accessories `675399344058025061` | `defc18f4-961b-494f-9953-c6108d9bfebc` | [11-09 13:23:39](https://i.etsystatic.com/46725934/r/il/e267a0/6854300443/il_794xN.6854300443_rhls.jpg) | 11-09 13:25:57 |
| SobiaStudio [4449121553](https://www.etsy.com/listing/4449121553/vintage-floral-tie-up-curtainfarmhouse) | P1 | CyndiZhangStudio `801218658646993070` | `0ed4a08a-e192-44c9-8ce8-ea6477725bf7` | [11-09 13:23:44](https://i.etsystatic.com/42208273/r/il/7815e0/7702622062/il_794xN.7702622062_5jbq.jpg) | 11-09 13:25:59 |
| StellaGoodsGifts [4579441057](https://www.etsy.com/listing/4579441057/green-monkeys-velvet-pillow-cover) | P1 | CyndiZhangStudio `801218658646993070` | `567558ba-3571-41ee-88f8-da5e85045222` | [11-09 13:23:53](https://i.etsystatic.com/54217402/r/il/0bf523/8554557570/il_794xN.8554557570_bnz8.jpg) | 11-09 13:26:00 |
| KoltCraftStudio [1836691662](https://www.etsy.com/listing/1836691662/camphor-wood-suit-hanger-wide-shoulder) | P2 | storage `863494997243989843` | `88cc08b2-fd48-43bb-8532-cb60a703900b` | [11-10 01:21:14](https://i.etsystatic.com/43671795/r/il/79db09/6580157037/il_794xN.6580157037_ewvs.jpg) | 11-10 01:22:48 |
| QuGifts [4348895208](https://www.etsy.com/listing/4348895208/wabi-sabi-cowrie-shell-hanging-boho) | P4 | Decor `675399344056772225` | `8a2a9dd8-75b1-4cb5-8081-0f86ff2852ca` | [11-10 01:21:19](https://i.etsystatic.com/38006525/r/il/1bb1a0/7093405382/il_794xN.7093405382_h7ji.jpg) | 11-10 01:22:50 |
| TunaMunStudio [4605390280](https://www.etsy.com/listing/4605390280/linen-cotton-cafe-curtain-red-deer-short) | P1 | CyndiZhangStudio `801218658646993070` | `ffa42c40-01c0-4542-ae29-a5466fccecda` | [11-10 01:21:32](https://i.etsystatic.com/60242016/r/il/e24937/8808639443/il_794xN.8808639443_6f79.jpg) | 11-10 01:22:52 |

**未入库候选：** [11 月 9 日晚间检查](https://github.com/Sailin09/Store-Promotion/blob/main/operations/replenishment/cloud-run-20261109-111217.json)和[11 月 10 日早间检查](https://github.com/Sailin09/Store-Promotion/blob/main/operations/replenishment/cloud-run-20261109-231637.json)均未提交批次。Chtte 13 个、NinaJiaStudio 24 个可见 ID 均已知；HibiChStudio 有 13 个未知 ID，但不符合已核准的 Wall & Door Organizers 分类。同一批未知 ID 不重复计数，均未入库。

**库存与缺口（核验时点，每路线目标 3）**

| 账号 | 达标路线（各 3 / 0） | 缺货路线（可用 / 缺口） | 合计可用 / 缺口 |
|---|---|---|---|
| P1 | AmyHomeCrafts、beou、ChicDecorHK、CustomCurtainsStudio、DanyHomeDesign、FrenchStyleDecor、HeyDream、KorusStore、MiraKiuStudio、NiceCraftStudioHK、Parkermo、ShirieHomeShow、SobiaStudio、StellaGoodsGifts、TunaMunStudio、WOGOL | Chtte 2/1、GavinHome 2/1 | 52 / 2 |
| P2 | Adamideal、KoltCraftStudio、LambertHouse、MiawoodStudio | HibiChStudio 0/3、WoodHomeLiang 2/1 | 14 / 4 |
| P3 | LoomGoStudio | Chtte 0/3、CellaHo 2/1 | 5 / 4 |
| P4 | PearlsTreasuresArt、QuGifts | ChicDecorHK 2/1 | 8 / 1 |
| P5 | — | NinaJiaStudio 1/2、NngGoods 2/1 | 3 / 3 |

**修复及未解决事项：** 本期补齐的路线和之后的库存消耗已反映在上表。未确认有发布修复；仍有 9 条路线缺货，其中 Chtte P3、HibiChStudio P2 为零库存。[云端库存工作流](https://github.com/Sailin09/Store-Promotion/actions/runs/42730255083/job/129546306066)及 Issue 中旧库存通知使用目标 7，与本日报目标 3 的缺口不可直接比较。首次缺口跟进状态仍为 `completed`。本次只重跑了只读核验，未触发发布或补货。

**截止后事件：** 10:00 至本次数据库核验时点未见新增 Pin 或已核实入库；核验时点之后不在本期覆盖范围。