# 执行日报 2026-11-15

<!-- store-promotion-daily:2026-11-15 -->

**本期实际发布 9 条唯一 Pin，补货实际入库 9 条。** 两批入库失败均为 0，实际重跑均新增 0 条。日报核验时，9 条新增素材均为 `ready`、`snapshot_matches=true`；32 条有效路线共有 **81 条可用素材、15 条缺口**，每条路线目标 3。

统计区间：北京时间 **11 月 14 日 10:00（含）至 11 月 15 日 10:00（不含）**，对应 UTC 11 月 14 日 02:00 至 11 月 15 日 02:00，续接[上一份成功日报](https://github.com/Sailin09/Store-Promotion/issues/2#issuecomment-6869900512)。北京时间 **10:00:04** 请求[只读复核](https://github.com/Sailin09/Store-Promotion/actions/runs/43620835957/job/132664380133)，数据库审计时间为 **10:00:23.760**（UTC `2026-11-15T02:00:23.760421+00:00`），比逻辑截止晚 **23.760 秒**；作业日志于 **10:00:25.905** 结束。下文均为北京时间，表中显示到秒，归期使用原始时间。

**Pinterest 实际发布**

P1 `@icyndizhang` **3** 条；P2 `@sailing_981` **3** 条；P3 `@mydecorshop` **0** 条（区间已确认 0）；P4 `@cindyzhang62` **2** 条；P5 `@ivy5205` **1** 条。按数据库 `published_at` 和唯一 Pin ID 计数。P5 在上日报列为截止后事件的 Pin，本期按真实发布时间计入一次。

| 账号 | 实际发布时间 | 店铺 / Etsy 商品 | Pin |
|---|---|---|---|
| P5 | 11-14 10:00:02 | NngGoods [4594927622](https://www.etsy.com/listing/4594927622) | [713820609737960243](https://www.pinterest.com/pin/713820609737960243/) |
| P1 | 11-14 10:05:02 | ChicDecorHK [4450228164](https://www.etsy.com/listing/4450228164) | [801218590009817593](https://www.pinterest.com/pin/801218590009817593/) |
| P2 | 11-14 10:10:03 | MiawoodStudio [1877277501](https://www.etsy.com/listing/1877277501) | [863494928599598322](https://www.pinterest.com/pin/863494928599598322/) |
| P1 | 11-14 21:00:06 | TunaMunStudio [4391069404](https://www.etsy.com/listing/4391069404) | [801218590009824891](https://www.pinterest.com/pin/801218590009824891/) |
| P2 | 11-14 21:05:01 | KoltCraftStudio [1836691662](https://www.etsy.com/listing/1836691662) | [863494928599604282](https://www.pinterest.com/pin/863494928599604282/) |
| P4 | 11-14 21:15:04 | PearlsTreasuresArt [4515043853](https://www.etsy.com/listing/4515043853) | [675399275414911318](https://www.pinterest.com/pin/675399275414911318/) |
| P1 | 11-15 08:00:04 | DanyHomeDesign [1886430383](https://www.etsy.com/listing/1886430383) | [801218590009835483](https://www.pinterest.com/pin/801218590009835483/) |
| P2 | 11-15 08:05:02 | Adamideal [4486320024](https://www.etsy.com/listing/4486320024) | [863494928599612747](https://www.pinterest.com/pin/863494928599612747/) |
| P4 | 11-15 08:15:02 | QuGifts [4363646198](https://www.etsy.com/listing/4363646198) | [675399275414919990](https://www.pinterest.com/pin/675399275414919990/) |

**Etsy 实际补货**

- 第一批：[入库及实际重跑](https://github.com/Sailin09/Store-Promotion/actions/runs/43560653624/job/132343447074)，首次 `inserted=6`、`failed=0`，重跑 `inserted=0`。[批次](https://github.com/Sailin09/Store-Promotion/blob/main/operations/replenishment/batch-20261114-051525.json) · [入库后数据库核验](https://github.com/Sailin09/Store-Promotion/actions/runs/43560729165/job/132343581850) · [详情与主图证据](https://github.com/Sailin09/Store-Promotion/blob/main/operations/replenishment/cloud-run-20261114-051525.json)。
- 第二批：[入库及实际重跑](https://github.com/Sailin09/Store-Promotion/actions/runs/43620737975/job/132525747070)，首次 `inserted=3`、`failed=0`，重跑 `inserted=0`。[批次](https://github.com/Sailin09/Store-Promotion/blob/main/operations/replenishment/batch-20261114-172144.json) · [入库后数据库核验](https://github.com/Sailin09/Store-Promotion/actions/runs/43620835957/job/132525919868) · [详情与主图证据](https://github.com/Sailin09/Store-Promotion/blob/main/operations/replenishment/cloud-run-20261114-172144.json)。

9 个商品 ID 和 9 个 `queue_id` 均唯一。入库后的独立复核确认来源和 Board 与批次相符；日报复核再次确认队列状态和审核快照。Etsy 链接为核验来源页；主图核验时间链接到当时实际查看的原图。两份运行证据逐条记录了详情页卖家、在售选项、购物车按钮及截图所见。

| 店铺 / Etsy 商品 | 账号 | Board / ID | queue_id | 实际主图核验 | 实际入库 | 当前状态 / 快照一致 |
|---|---|---|---|---|---|---|
| ChicDecorHK [1748514263](https://www.etsy.com/listing/1748514263/handmade-ramie-roman-blind-natural-linen) | P1 `@icyndizhang` | CyndiZhangStudio `801218658646993070` | `db0f58a4-bf10-4d38-8863-5c8d15db17d5` | [11-14 13:14:42](https://i.etsystatic.com/32003756/r/il/4957f8/6405499923/il_794xN.6405499923_ry8f.jpg) | 11-14 13:16:12 | ready / true |
| LambertHouse [4553782826](https://www.etsy.com/listing/4553782826/aluminum-single-clip-hanger-space-saving) | P2 `@sailing_981` | storage `863494997243989843` | `a4464e95-01e5-44a7-a95d-de09b513d1b6` | [11-14 13:14:42](https://i.etsystatic.com/46944744/r/il/971631/8415227673/il_794xN.8415227673_szim.jpg) | 11-14 13:16:16 | ready / true |
| MiawoodStudio [1777678184](https://www.etsy.com/listing/1777678184/personalized-beechwood-hanger-minimalist) | P2 `@sailing_981` | storage `863494997243989843` | `2194e87b-b09e-4879-9d08-6d7b01985e52` | [11-14 13:14:42](https://i.etsystatic.com/32100253/r/il/1695dc/6262069428/il_794xN.6262069428_aoq3.jpg) | 11-14 13:16:17 | ready / true |
| NngGoods [4585504377](https://www.etsy.com/listing/4585504377/french-brass-crystal-cabinet-knob) | P5 `@ivy5205` | Furniture `713820678377803412` | `9abbb54e-0e00-40b3-b922-16f6e719a8e1` | [11-14 13:14:48](https://i.etsystatic.com/57194200/r/il/e6bfcc/8877316675/il_794xN.8877316675_i6dg.jpg) | 11-14 13:16:18 | ready / true |
| QuGifts [4359526157](https://www.etsy.com/listing/4359526157/handmade-bali-shell-hanging-boho-coastal) | P4 `@cindyzhang62` | Decor `675399344056772225` | `a4d8f1ce-8bab-499c-9469-1f454f7489fc` | [11-14 13:14:48](https://i.etsystatic.com/38006525/r/il/a06157/7148335780/il_794xN.7148335780_dzgr.jpg) | 11-14 13:16:19 | ready / true |
| ShirieHomeShow [4438747143](https://www.etsy.com/listing/4438747143/sheer-floral-curtains-lavender-garden) | P1 `@icyndizhang` | CyndiZhangStudio `801218658646993070` | `e023bf19-ea61-4064-9af8-c4fb6c8fc406` | [11-14 13:14:48](https://i.etsystatic.com/46873252/r/il/054bd0/7586651960/il_794xN.7586651960_mar4.jpg) | 11-14 13:16:20 | ready / true |
| PearlsTreasuresArt [4338007062](https://www.etsy.com/listing/4338007062/boho-conch-shell-pendant-necklace-pearl) | P4 `@cindyzhang62` | Jewelry & Accessories `675399344058025061` | `4a2b61ad-d093-4d90-a4a7-dcce80be1667` | [11-15 01:20:52](https://i.etsystatic.com/46725934/r/il/22df82/7083638573/il_794xN.7083638573_8phz.jpg) | 11-15 01:23:03 | ready / true |
| KoltCraftStudio [1841543541](https://www.etsy.com/listing/1841543541/walnut-wood-hanger-with-brass-hook) | P2 `@sailing_981` | storage `863494997243989843` | `caefd913-a993-4bdb-97ac-55eab7dc383f` | [11-15 01:21:13](https://i.etsystatic.com/43671795/r/il/32dbc7/8162339897/il_794xN.8162339897_b58b.jpg) | 11-15 01:23:09 | ready / true |
| TunaMunStudio [4544279952](https://www.etsy.com/listing/4544279952/plaid-cabinet-curtain-farmhouse-kitchen) | P1 `@icyndizhang` | CyndiZhangStudio `801218658646993070` | `e5c0b461-2e43-4f6b-bc77-03355564aa5d` | [11-15 01:21:25](https://i.etsystatic.com/60242016/r/il/108374/8372419224/il_794xN.8372419224_a30a.jpg) | 11-15 01:23:11 | ready / true |

**未入库候选：** [11 月 14 日 19:18 的检查](https://github.com/Sailin09/Store-Promotion/blob/main/operations/replenishment/cloud-run-20261114-111816.json)和[11 月 15 日 07:22 的检查](https://github.com/Sailin09/Store-Promotion/blob/main/operations/replenishment/cloud-run-20261114-232200.json)没有符合既有分类且未登记的新商品，均未建批次。HibiChStudio 两次看到的是同一组 13 个未登记 ID，商品为收纳袋、箱、篮或防尘衣罩等，未匹配 Wall & Door Organizers；未做详情和主图核验，不计入库。Chtte 的 14 个、NinaJiaStudio 的 24 个及 ChicDecorHK 贝壳首饰专区的 22 个可见 ID 均已登记。

**各路线库存（核验时点，每条目标 3）**

| 账号 | 可用 3、缺口 0 的路线 | 其他路线（可用 / 缺口） | 合计可用 / 缺口 |
|---|---|---|---|
| P1 | AmyHomeCrafts、beou、ChicDecorHK、CustomCurtainsStudio、FrenchStyleDecor、GavinHome、HeyDream、KorusStore、MiraKiuStudio、NiceCraftStudioHK、Parkermo、ShirieHomeShow、SobiaStudio、StellaGoodsGifts、TunaMunStudio、WOGOL | Chtte 2/1、DanyHomeDesign 2/1 | 52 / 2 |
| P2 | KoltCraftStudio、LambertHouse、MiawoodStudio、WoodHomeLiang | HibiChStudio 0/3、Adamideal 2/1 | 14 / 4 |
| P3 | CellaHo、LoomGoStudio | Chtte 0/3 | 6 / 3 |
| P4 | PearlsTreasuresArt | ChicDecorHK 2/1、QuGifts 2/1 | 7 / 2 |
| P5 | — | NinaJiaStudio 0/3、NngGoods 2/1 | 2 / 4 |
| 合计 | 23 条 | 9 条有缺口 | **81 / 15** |

上表按同一快照的 `usable` 计算每条路线缺口，未采用独立库存报告的目标 7。两次日报快照对账：上一快照 **81** 已扣除本期第一条 P5 Pin；加本期入库 **9**，扣本期其余发布 **8**，再扣本次截止后发布 **1**，等于本次快照 **81**。

**未发布、失败、修复与待处理**

- **Chtte P3** 的 [4616101190](https://www.etsy.com/listing/4616101190/chair-cushion-set-cotton-linen-seat-pad) 延续上期的 `paused / uncertain`，错误 `pin_response_503`，尝试 ID `c6bd08a5-afc4-495c-a309-8482d88efefb`。仍无 Pin ID 或已发布历史；Pinterest 端最终结果未确认，本期未见重试或重置。复核未见其他未完成发布尝试或暂停、失败的队列记录。P3 本期为 0 条；除上述历史异常，其他逐次未发布原因未确认。
- 五个账号均启用且 OAuth 已连接，数据库发布调度启用。81 条可用素材等待现有调度，逐条未来发布时间未确认。另有草稿 85 条（P1 55、P2 26、P3 4、P4 0、P5 0），其中 3 条带图，均不计可用库存。
- 区间内四次 GitHub 发布作业均记录 `idle / outside_publish_window`、`published=0`：[11 月 14 日 11:18](https://github.com/Sailin09/Store-Promotion/actions/runs/43550947941/job/132313007936)、[19:29](https://github.com/Sailin09/Store-Promotion/actions/runs/43590278524/job/132433362391)、[11 月 15 日 02:05](https://github.com/Sailin09/Store-Promotion/actions/runs/43624604149/job/132537541422)、[06:26](https://github.com/Sailin09/Store-Promotion/actions/runs/43648084383/job/132610230226)。这些作业未产生 Pin，表内 9 条以 Supabase 发布历史为证。
- [晚间报告作业](https://github.com/Sailin09/Store-Promotion/actions/runs/43628748131/job/132550508830)于 **11 月 15 日 02:50:18** 在报告生成步骤以退出码 1 失败；[运行产物](https://github.com/Sailin09/Store-Promotion/actions/runs/43628748131/artifacts/14126929400)已保留，日志未披露根因。[延迟晚间报告修复 PR #8](https://github.com/Sailin09/Store-Promotion/pull/8)已合入，但本期仍复现。[05:30 独立库存报告](https://github.com/Sailin09/Store-Promotion/actions/runs/43643085652/job/132594847437)更新了 Issue #2，不代表晚间报告恢复。
- 两批补货未见写入失败或重跑重复行。首次缺口跟进保持 [`completed`](https://github.com/Sailin09/Store-Promotion/blob/main/operations/replenishment/first-deficit-followup.json)。本次日报仅重跑只读核验并记录证据，未触发发布、补货或修复，现有业务任务未改动。

**截止后事件（不计入本期）**

- 11 月 15 日 **10:00:03.756**，P5 `@ivy5205` 实际发布 NngGoods [4582982364](https://www.etsy.com/listing/4582982364)，[Pin 713820609737975995](https://www.pinterest.com/pin/713820609737975995/)。该 Pin 已消耗核验时点库存。
- 截至本次核验未见截止后入库证据。10:00 发起的请求 `1372` 在采样中尚无完成结果；Pin 以独立发布历史为准，未推定请求与 Pin 的对应关系。

**证据覆盖与投递**

本次通过 GitHub 连接器读取最新 main、两份批次、四份区间补货记录和 Issue #2 的 130 条既有评论，并按标题定位[历史发布复核 Issue](https://github.com/Sailin09/Store-Promotion/issues/3)。发布历史查询覆盖完整区间；两批逐条入库日志、库存中 9 条新增队列及已知商品 ID 从 512 到 521 的变化一致。审核库存查询不覆盖所有类型的数据库写入；调度采样仅保留最近 10 条 cron 和 20 条 HTTP 请求，**区间内瞬时错误及逐次未发布原因覆盖不完整**。

[Markdown 归档](https://github.com/Sailin09/Store-Promotion/blob/main/operations/replenishment/daily-report-2026-11-15.md) · [JSON 证据](https://github.com/Sailin09/Store-Promotion/blob/main/operations/replenishment/daily-report-2026-11-15.json) · [GitHub Issue #2](https://github.com/Sailin09/Store-Promotion/issues/2)。同一正文用于 GitHub 当日唯一日报评论和本云端任务聊天；设备通知送达未独立核验。