# 执行日报 2026-11-17
<!-- store-promotion-daily:2026-11-17 -->

Sailin09/Store-Promotion｜**确认发布 10 条 Pin，确认补货入库 9 条。** 两批幂等重跑均为零新增。核验时可用库存 **80 / 96**，8 条路线合计缺 **16** 条。

**区间与证据。** 北京时间 **11-16 10:00（含）至 11-17 10:00（不含）**，即 UTC `[2026-11-16T02:00:00Z, 2026-11-17T02:00:00Z)`，续接[上次成功日报](https://github.com/Sailin09/Store-Promotion/issues/2#issuecomment-6905356753)。本次通过 GitHub 连接器核对 [main](https://github.com/Sailin09/Store-Promotion/tree/35348c8707b0cbc2e794ca1a6859533d91d0c962)、[Issue #2](https://github.com/Sailin09/Store-Promotion/issues/2) 两页 142 条既有评论及按标题找到的[发布复核 Issue #3](https://github.com/Sailin09/Store-Promotion/issues/3)。[新 Verify Supabase Data](https://github.com/Sailin09/Store-Promotion/actions/runs/43978133599/job/133760502070) 的数据时间为 **11-17 10:00:22.7217**，核验晚于逻辑截止 **0 分 22.721 秒**。下表时间均为北京时间。

**Pinterest 实际发布。** 以 `published_at` 和唯一 Pin ID 计数；数据库发布历史覆盖区间，并与五账号记录和库存报告中的商品信息交叉核对。

| 账号 | 区间新增 | Pin | 店铺 · Etsy 商品 | 实际发布时间 |
|---|---:|---|---|---|
| P1 `icyndizhang` | 3 | [801218590009854665](https://www.pinterest.com/pin/801218590009854665/) | WOGOL · [4370222007](https://www.etsy.com/listing/4370222007/) | 11-16 10:05:02.495766 |
| P1 `icyndizhang` |  | [801218590009861936](https://www.pinterest.com/pin/801218590009861936/) | beou · [4553569611](https://www.etsy.com/listing/4553569611/) | 11-16 21:00:03.317933 |
| P1 `icyndizhang` |  | [801218590009871874](https://www.pinterest.com/pin/801218590009871874/) | NiceCraftStudioHK · [1837658116](https://www.etsy.com/listing/1837658116/) | 11-17 08:00:04.508254 |
| P2 `sailing_981` | 3 | [863494928599629895](https://www.pinterest.com/pin/863494928599629895/) | Adamideal · [4423854894](https://www.etsy.com/listing/4423854894/) | 11-16 10:10:02.275423 |
| P2 `sailing_981` |  | [863494928599636767](https://www.pinterest.com/pin/863494928599636767/) | WoodHomeLiang · [1608285528](https://www.etsy.com/listing/1608285528/) | 11-16 21:05:02.993517 |
| P2 `sailing_981` |  | [863494928599645403](https://www.pinterest.com/pin/863494928599645403/) | KoltCraftStudio · [4360184975](https://www.etsy.com/listing/4360184975/) | 11-17 08:05:02.899573 |
| P3 `mydecorshop` | 0 | — | — | — |
| P4 `cindyzhang62` | 3 | [675399275414938469](https://www.pinterest.com/pin/675399275414938469/) | ChicDecorHK · [1585132122](https://www.etsy.com/listing/1585132122/) | 11-16 10:25:02.234332 |
| P4 `cindyzhang62` |  | [675399275414944358](https://www.pinterest.com/pin/675399275414944358/) | PearlsTreasuresArt · [1890266206](https://www.etsy.com/listing/1890266206/) | 11-16 21:25:02.407057 |
| P4 `cindyzhang62` |  | [675399275414953055](https://www.pinterest.com/pin/675399275414953055/) | QuGifts · [4359526157](https://www.etsy.com/listing/4359526157/) | 11-17 08:25:02.084452 |
| P5 `ivy5205` | 1 | [713820609737993042](https://www.pinterest.com/pin/713820609737993042/) | NngGoods · [4585514605](https://www.etsy.com/listing/4585514605/) | 11-16 10:15:02.932342 |

**未发布、失败与待处理。** P3 的 Chtte [4616101190](https://www.etsy.com/listing/4616101190/) 仍为 `paused / uncertain`（历史错误 `pin_response_503`，无 Pin ID 或发布时间；队列 `35c31472-0b55-4f6d-bd70-eb336463ee80`，尝试 `c6bd08a5-afc4-495c-a309-8482d88efefb`）。 GitHub 发布 job 实际日志： [11-16 10:44](https://github.com/Sailin09/Store-Promotion/actions/runs/43794003072/job/133058574975) 为 `idle`（原因未注明），[11-16 19:23](https://github.com/Sailin09/Store-Promotion/actions/runs/43857304194/job/133264750592) 和 [11-17 06:05](https://github.com/Sailin09/Store-Promotion/actions/runs/43966591942/job/133647537217) 均为 `outside_publish_window`，三个 job 均未发布。调度和 HTTP 日志最多分别 10、20 条，逐次尝试及未发布原因覆盖不完整；HTTP 200 或 idle 不计为发布。

**补货入库。** 按数据库 `created_at` 和唯一 queue ID 计数。每项来源为表中 Etsy 商品详情；两批现场证据记录了卖家、在售规格或数量、可用的 Add to cart 和实际查看的云端 CDP 原始主图。状态列为“入库后 → 本次核验”的 `queue_status / snapshot_matches`。

| 批次 | 店铺 · Etsy 商品 | 账号 | Board / ID | queue_id | 状态 / 快照 | 入库时间 | 视觉核验时间 · 来源图 |
|---|---|---|---|---|---|---|---|
| A | Adamideal · [4486784943](https://www.etsy.com/listing/4486784943/wood-cord-organizer-wire-holder-clip) | P2 `sailing_981` | storage / `863494997243989843` | `b9ef8367-cd9f-49a8-8e0e-06feb8ca15f9` | ready / true → ready / true | 11-16 13:21:18.0413 | 11-16 13:18:58.457 · [主图](https://i.etsystatic.com/35172699/r/il/90a8fd/7948104471/il_794xN.7948104471_ipty.jpg) |
| A | AmyHomeCrafts · [4549644887](https://www.etsy.com/listing/4549644887/white-tie-top-cafe-curtain-with-lace) | P1 `icyndizhang` | CyndiZhangStudio / `801218658646993070` | `9b7fe4e4-cce1-4d11-80e5-77a4c4d34cd7` | ready / true → ready / true | 11-16 13:21:21.707083 | 11-16 13:17:57.512 · [主图](https://i.etsystatic.com/40547461/r/il/861164/8709271028/il_794xN.8709271028_pb3w.jpg) |
| A | LambertHouse · [4546244084](https://www.etsy.com/listing/4546244084/510-pcs-aluminum-pants-hangers-set) | P2 `sailing_981` | storage / `863494997243989843` | `0b606d5f-032f-4ddd-9df0-b2c37d6da053` | ready / true → ready / true | 11-16 13:21:22.615625 | 11-16 13:17:59.994 · [主图](https://i.etsystatic.com/46944744/r/il/e9f1b2/8313283424/il_794xN.8313283424_fdnm.jpg) |
| A | NngGoods · [4559854600](https://www.etsy.com/listing/4559854600/natural-ruby-stone-cabinet-knob-brass) | P5 `ivy5205` | Furniture / `713820678377803412` | `df1cb8e8-ce87-4535-ade1-fc355b6f44ac` | ready / true → ready / true | 11-16 13:21:24.685261 | 11-16 13:18:02.332 · [主图](https://i.etsystatic.com/57194200/r/il/08fc7d/8830001872/il_794xN.8830001872_66gj.jpg) |
| A | WOGOL · [4548766143](https://www.etsy.com/listing/4548766143/vintage-linen-look-stripe-curtains-semi) | P1 `icyndizhang` | CyndiZhangStudio / `801218658646993070` | `cc853933-748d-4422-a9db-ef9d652d712b` | ready / true → ready / true | 11-16 13:21:25.510259 | 11-16 13:19:41.057 · [主图](https://i.etsystatic.com/45174159/r/il/68c50a/8540753188/il_794xN.8540753188_jpui.jpg) |
| B | beou · [4516260521](https://www.etsy.com/listing/4516260521/rustic-linen-seat-cushion-non-slip-tie) | P1 `icyndizhang` | CyndiZhangStudio / `801218658646993070` | `81ad698f-8b4b-4cf7-898f-92213e878cc1` | ready / true → ready / true | 11-17 07:18:12.599048 | 11-17 07:16:00.572 · [主图](https://i.etsystatic.com/31778838/r/il/571e30/8144213365/il_794xN.8144213365_8hc0.jpg) |
| B | PearlsTreasuresArt · [4436880116](https://www.etsy.com/listing/4436880116/handmade-natural-conch-shell-statement) | P4 `cindyzhang62` | Jewelry & Accessories / `675399344058025061` | `1cae214b-5eba-4199-86c1-1c4b105812e7` | ready / true → ready / true | 11-17 07:18:14.797517 | 11-17 07:16:00.587 · [主图](https://i.etsystatic.com/46725934/r/il/616928/7575213204/il_794xN.7575213204_shsb.jpg) |
| B | QuGifts · [4337069578](https://www.etsy.com/listing/4337069578/handwoven-shell-placemats-coasters) | P4 `cindyzhang62` | Decor / `675399344056772225` | `bcca963e-ed25-4539-ac37-d0babe067f2d` | ready / true → ready / true | 11-17 07:18:15.628449 | 11-17 07:16:33.276 · [主图](https://i.etsystatic.com/38006525/r/il/e10124/7076276117/il_794xN.7076276117_6456.jpg) |
| B | WoodHomeLiang · [1753107678](https://www.etsy.com/listing/1753107678/walnut-wood-suit-hangers-heavy-duty-with) | P2 `sailing_981` | storage / `863494997243989843` | `20ab2fdc-a42b-4f5d-ac92-a1730daa2d21` | ready / true → ready / true | 11-17 07:18:20.275842 | 11-17 07:16:00.601 · [主图](https://i.etsystatic.com/38928671/r/il/887057/6147262748/il_794xN.6147262748_3kdu.jpg) |

| 批次与现场记录 | 首次执行 | 实际幂等重跑 | 入库后证据 |
|---|---|---|---|
| A： [批次](https://github.com/Sailin09/Store-Promotion/blob/main/operations/replenishment/batch-20261116-052013.json) · [店面、详情与截图核验证据](https://github.com/Sailin09/Store-Promotion/blob/main/operations/replenishment/cloud-run-20261116-052013.json) | [run 43809594324 / job 133108173816](https://github.com/Sailin09/Store-Promotion/actions/runs/43809594324/job/133108173816)：`inserted=5, failed=0` | 同 job 实际重跑，11-16 13:21:26.2112154：`inserted=0` | [数据库复核](https://github.com/Sailin09/Store-Promotion/actions/runs/43809711516/job/133108393398) |
| B： [批次](https://github.com/Sailin09/Store-Promotion/blob/main/operations/replenishment/batch-20261116-231703.json) · [店面、详情与截图核验证据](https://github.com/Sailin09/Store-Promotion/blob/main/operations/replenishment/cloud-run-20261116-231703.json) | [run 43977958733 / job 133686988074](https://github.com/Sailin09/Store-Promotion/actions/runs/43977958733/job/133686988074)：`inserted=4, failed=0` | 同 job 实际重跑，11-17 07:18:21.0385972：`inserted=0` | [数据库复核](https://github.com/Sailin09/Store-Promotion/actions/runs/43978133599/job/133687308255) |

已知商品 ID 由上次核验的 530 个增至 539 个；新增的 9 个 ID 与两批实际入库完全一致；两批日志无重复跳过或失败。**未入库候选与中断：** [11-17 01:21 限流记录](https://github.com/Sailin09/Store-Promotion/blob/main/operations/replenishment/cloud-run-20261116-172113.json)显示 ChicDecorHK 店面返回 `429 Too Many Requests`（参考号 `penelope_frl`），该轮停止访问，未生成批次；后续店面可打开。后续 HibiChStudio 的 13 个未入库 ID 未匹配现有墙门收纳分类，其中挂式候选 `4517906376` 的详情确认为衣柜衣物罩。ChicDecorHK 贝壳首饰区、Chtte 与 NinaJiaStudio 可见相关 ID 均已登记；其他仅发现但未完成核验的候选不计成功。

**当前库存（只读核验时点）。** 按 `max(0, 3 − usable)` 计算每条路线缺口。32 条有效路线目标合计 96；可用 80，缺 16。

| 未达标店铺 | 账号 | 可用 / 目标 | 缺口 |
|---|---|---:|---:|
| ChicDecorHK | P4 `cindyzhang62` | 0 / 3 | 3 |
| Chtte | P3 `mydecorshop` | 0 / 3 | 3 |
| HibiChStudio | P2 `sailing_981` | 0 / 3 | 3 |
| NinaJiaStudio | P5 `ivy5205` | 0 / 3 | 3 |
| Chtte | P1 `icyndizhang` | 2 / 3 | 1 |
| KoltCraftStudio | P2 `sailing_981` | 2 / 3 | 1 |
| NiceCraftStudioHK | P1 `icyndizhang` | 2 / 3 | 1 |
| QuGifts | P4 `cindyzhang62` | 2 / 3 | 1 |

| 已达标账号 | 店铺（各 3 / 3，缺口 0） |
|---|---|
| P1 `icyndizhang` | AmyHomeCrafts、beou、ChicDecorHK、CustomCurtainsStudio、DanyHomeDesign、FrenchStyleDecor、GavinHome、HeyDream、KorusStore、MiraKiuStudio、Parkermo、ShirieHomeShow、SobiaStudio、StellaGoodsGifts、TunaMunStudio、WOGOL |
| P2 `sailing_981` | Adamideal、LambertHouse、MiawoodStudio、WoodHomeLiang |
| P3 `mydecorshop` | CellaHo、LoomGoStudio |
| P4 `cindyzhang62` | PearlsTreasuresArt |
| P5 `ivy5205` | NngGoods |

**已修复与未解决。** Etsy 限流在后续补货轮未复现。[PR #8](https://github.com/Sailin09/Store-Promotion/pull/8) 的延迟快照修复已合入，但[独立晚间报告](https://github.com/Sailin09/Store-Promotion/actions/runs/43975212196/job/133677598247)在 11-17 07:00:26 仍以退出码 1 结束，根因未确认；[留存产物](https://github.com/Sailin09/Store-Promotion/actions/runs/43975212196/artifacts/14279463518)的内容未核实。之后[库存报告](https://github.com/Sailin09/Store-Promotion/actions/runs/43990554253/job/133729875837)更新了 [Issue #2 库存记录](https://github.com/Sailin09/Store-Promotion/issues/2#issuecomment-6934164955)，晚间报告仍未确认恢复。首次缺口跟进为 [`completed`](https://github.com/Sailin09/Store-Promotion/blob/main/operations/replenishment/first-deficit-followup.json)。本次只重跑只读核验，未发起发布、补货或修复。

**截止之后（不计入区间）。**

核验时未发现可确认的截止后 Pin。 核验时未发现可确认的截止后新增入库。调度请求：`1492`（11-17 10:00:00.089285：结果待定）。

**投递与归档。** 同一正文用于 [GitHub Issue #2](https://github.com/Sailin09/Store-Promotion/issues/2) 的当日唯一日报评论和本云端任务聊天；[Markdown 归档](https://github.com/Sailin09/Store-Promotion/blob/main/operations/replenishment/daily-report-2026-11-17.md) · [JSON 证据](https://github.com/Sailin09/Store-Promotion/blob/main/operations/replenishment/daily-report-2026-11-17.json)。设备通知送达未独立核验。