# 执行日报 2026-11-20
<!-- store-promotion-daily:2026-11-20 -->

本区间真实新增 **9 个 Pin、8 条补货素材**；两批首次 inserted 分别 **5、3**，实际幂等重跑均为 **0**。核验时有效库存 **79**，按每路线 target=3 计算缺口 **17**。P3 的不确定发布与晚间报告错误仍未解决。

## 区间与证据

- 北京时间：**2026-11-19 10:00（含）—2026-11-20 10:00（不含）**；UTC：2026-11-19 02:00—2026-11-20 02:00。
- 沿用上次成功截止 2026-11-19T02:00:00Z；本次逻辑截止固定为 2026-11-20T02:00:00Z。
- 截止后重跑了最新只读 Verify；数据库数据时间 **2026-11-20 10:00:32.308822 北京时间**，比逻辑截止晚 **32.309 秒**。实际证据核对时间 **10:01:01 北京时间**，延迟 1 分 1 秒；库存为数据时点值，不能当作区间新增量。
- 本次 GitHub 连接器已确认访问最新 main（读取头 fbefdcf0c88258d331618a5a37f147fdb50d140b）。Issue #2 共 **157 条评论已分页读完**，未发现当日标记；按标题搜索并读取了[发布复核 Issue #3](https://github.com/Sailin09/Store-Promotion/issues/3)，其 2026-10-23 累计 62 条仅为历史资料，不作每日基线。
- [新 Verify 数据库日志](https://github.com/Sailin09/Store-Promotion/actions/runs/44576681386/job/136027755447)覆盖完整区间：daily_history 查询没有 LIMIT，按 published_at 筛区间并以 Pin ID 去重，再与审核队列历史关联店铺、商品。补货按唯一 queue_id、created_at、两批实际入库日志交叉核对。
- 覆盖限制：调度 HTTP 日志仅最近 20 条、cron 仅最近 10 条，**全天调度过程覆盖不完整**；晚间错误的二进制 artifact 内容未核验，具体失败原因未确认。workflow success、HTTP 200 或 idle 均未用来替代业务成功。

## 五账号发布

| 账号 | 区间新增 Pin | 核实情况 |
|---|---:|---|
| P1 icyndizhang | 3 | 已由唯一 Pin 历史核实 |
| P2 sailing_981 | 3 | 已由唯一 Pin 历史核实 |
| P3 mydecorshop | 0 | 已确认 0；不确定尝试另列，不计成功 |
| P4 cindyzhang62 | 2 | 已由唯一 Pin 历史核实 |
| P5 ivy5205 | 1 | 已由唯一 Pin 历史核实 |

全部可核实的新 Pin 如下，发布时间为数据库原始 **UTC**：

| 账号 | Pin 链接 | 店铺 / Etsy 商品 | published_at（UTC） |
|---|---|---|---|
| P1 | [801218590009906489](https://www.pinterest.com/pin/801218590009906489/) | WOGOL · [4438780453](https://www.etsy.com/listing/4438780453) | 2026-11-19T02:05:02.568477Z |
| P2 | [863494928599678062](https://www.pinterest.com/pin/863494928599678062/) | MiawoodStudio · [1777678184](https://www.etsy.com/listing/1777678184) | 2026-11-19T02:10:02.608271Z |
| P5 | [713820609738045926](https://www.pinterest.com/pin/713820609738045926/) | NngGoods · [4559854600](https://www.etsy.com/listing/4559854600) | 2026-11-19T02:30:03.105431Z |
| P1 | [801218590009913014](https://www.pinterest.com/pin/801218590009913014/) | beou · [4513497018](https://www.etsy.com/listing/4513497018) | 2026-11-19T13:00:04.76441Z |
| P2 | [863494928599684629](https://www.pinterest.com/pin/863494928599684629/) | KoltCraftStudio · [1841543541](https://www.etsy.com/listing/1841543541) | 2026-11-19T13:05:02.95906Z |
| P4 | [675399275414991145](https://www.pinterest.com/pin/675399275414991145/) | PearlsTreasuresArt · [4436880116](https://www.etsy.com/listing/4436880116) | 2026-11-19T13:40:02.546671Z |
| P1 | [801218590009922382](https://www.pinterest.com/pin/801218590009922382/) | ChicDecorHK · [1734446544](https://www.etsy.com/listing/1734446544) | 2026-11-20T00:00:04.636119Z |
| P2 | [863494928599693455](https://www.pinterest.com/pin/863494928599693455/) | Adamideal · [4362890083](https://www.etsy.com/listing/4362890083) | 2026-11-20T00:05:03.065738Z |
| P4 | [675399275414999306](https://www.pinterest.com/pin/675399275414999306/) | QuGifts · [4337057344](https://www.etsy.com/listing/4337057344) | 2026-11-20T00:40:02.864422Z |

待发布与异常：

- P1、P2、P4、P5：区间新增已按上表核实。当前另有未发布草稿 P1=55、P2=26、P4=0、P5=0；P1/P2 草稿有图数均为 0，不能当作可发布已审核库存。
- P3：当前草稿 4 条，其中有图 3 条；已审核有效库存 6 条，但 CellaHo、LoomGoStudio 的 6 条 reserve_item 均为 eligible_configuration=false，具体子条件未由该字段展开，不能声称可立即发布。
- P3/Chtte 商品 [4616101190](https://www.etsy.com/listing/4616101190)，queue_id=35c31472-0b55-4f6d-bd70-eb336463ee80；queue_status=paused，attempt_state=uncertain，error=pin_response_503，Pin ID 未确认。attempt_id=c6bd08a5-afc4-495c-a309-8482d88efefb。这是延续中的异常，不计新 Pin，不重试。
- 区间三个 GitHub publisher job（135317992371、135584392046、135900945832）返回 idle；这些结果不代表当天没有发布，上表 9 个 Pin 来自数据库真实历史。

## 区间新增补货素材

以下 **8 条均已真实入库**，当前 queue_status=ready 且 snapshot_matches=true；候选不计入此表。

| 序号 | 店铺 / Etsy 商品 | 账号 / handle | Board 名称 / ID | queue_id | 状态 / 快照匹配 |
|---|---|---|---|---|---|
| 1 | DanyHomeDesign · [1850549017](https://www.etsy.com/listing/1850549017/green-botanical-print-curtains-rustic) | P1 / icyndizhang | CyndiZhangStudio / 801218658646993070 | 44094417-9be9-4435-a457-c553dc38cad7 | ready / true |
| 2 | LambertHouse · [1773610290](https://www.etsy.com/listing/1773610290/aluminum-alloy-clothes-hangers-non-slip) | P2 / sailing_981 | storage / 863494997243989843 | d7e6eed7-a414-424a-b4d4-846fbbca0dcf | ready / true |
| 3 | NngGoods · [4557856544](https://www.etsy.com/listing/4557856544/crystal-cabinet-knob-natural-quartz) | P5 / ivy5205 | Furniture / 713820678377803412 | bf8dbb50-828e-4ba3-9130-122cf7c7f45f | ready / true |
| 4 | QuGifts · [4318121435](https://www.etsy.com/listing/4318121435/pink-sea-urchin-wine-stopper-coastal-bar) | P4 / cindyzhang62 | Decor / 675399344056772225 | bbba1b9f-c2b7-4eed-b566-e044724053dd | ready / true |
| 5 | WOGOL · [4334264915](https://www.etsy.com/listing/4334264915/striped-linen-doorway-curtain-boho-room) | P1 / icyndizhang | CyndiZhangStudio / 801218658646993070 | f7f80a6f-4c76-4908-b2d3-02252fe4b64b | ready / true |
| 6 | beou · [4513969343](https://www.etsy.com/listing/4513969343/farmhouse-cotton-seat-back-cushion-tie) | P1 / icyndizhang | CyndiZhangStudio / 801218658646993070 | f8d7966d-8131-4e4e-8707-e29a0ef6faef | ready / true |
| 7 | KoltCraftStudio · [4576346337](https://www.etsy.com/listing/4576346337/solid-wood-pants-hanger-with-clips-non) | P2 / sailing_981 | storage / 863494997243989843 | 61707ff4-75e5-46d9-9ee0-4075b6db895b | ready / true |
| 8 | PearlsTreasuresArt · [4339512567](https://www.etsy.com/listing/4339512567/clear-quartz-necklace-turquoise-shell) | P4 / cindyzhang62 | Jewelry & Accessories / 675399344058025061 | 1635c28d-21c1-4e75-b86d-e846bce62d90 | ready / true |

来源与核验时间（均 UTC；保留原始历史证据时间，本日报没有重新做商品视觉审核）：

| 序号 | 实际入库 created_at | 来源/视觉审核 checked_at |
|---|---|---|
| 1 | 2026-11-19T05:14:55.186879Z | 2026-11-19T05:13:23.868Z |
| 2 | 2026-11-19T05:14:59.172634Z | 2026-11-19T05:13:24.300Z |
| 3 | 2026-11-19T05:15:00.301238Z | 2026-11-19T05:13:31.287Z |
| 4 | 2026-11-19T05:15:04.150644Z | 2026-11-19T05:13:31.676Z |
| 5 | 2026-11-19T05:15:04.641155Z | 2026-11-19T05:13:39.407Z |
| 6 | 2026-11-19T17:23:17.435499Z | 2026-11-19T17:21:51.362Z |
| 7 | 2026-11-19T17:23:22.692415Z | 2026-11-19T17:22:03.155Z |
| 8 | 2026-11-19T17:23:23.870276Z | 2026-11-19T17:21:52.025Z |

- 1—5：从登记店铺当时 storefront 发现，先排除 557 个已知 ID；真实详情卖家匹配，选项与启用的主 Add to cart 已核验；通过远程 CDP 实际查看各商品原始 794×794 主图截图。原图 URL、选项、文案和逐条证据保存在[批次 A](https://github.com/Sailin09/Store-Promotion/blob/main/operations/replenishment/batch-20261119-051339.json)与[运行记录 A](https://github.com/Sailin09/Store-Promotion/blob/main/operations/replenishment/cloud-run-20261119-051339.json)。
- 6—8：先排除 562 个已知 ID，再现场核验真实卖家、可选在售项和主图截图。视觉时间分别为 17:21:51.362、17:21:51.787、17:21:52.025；Kolt 的主按钮在变体更新后于 17:22:03.155 再确认启用。详见[批次 B](https://github.com/Sailin09/Store-Promotion/blob/main/operations/replenishment/batch-20261119-172203.json)与[运行记录 B](https://github.com/Sailin09/Store-Promotion/blob/main/operations/replenishment/cloud-run-20261119-172438.json)。
- 文图差异如实保留：WOGOL 主图为 tab-top，实际可选审核项为 Rod Pocket；beou 主图含坐垫和靠垫，审核选项仅单件坐垫，靠垫另售。

| 批次 | 首次 inserted | failed | 实际 retry inserted | run / job 证据 |
|---|---:|---:|---:|---|
| A · batch-20261119-051339 | 5 | 0 | 0 | [44463769896 / 135356646030](https://github.com/Sailin09/Store-Promotion/actions/runs/44463769896/job/135356646030) |
| B · batch-20261119-172203 | 3 | 0 | 0 | [44576503878 / 135745555979](https://github.com/Sailin09/Store-Promotion/actions/runs/44576503878/job/135745555979) |

两份日志均含首次逐条插入和随后“Verify idempotent retry”的 inserted=0；新 Verify 再次核实全部 8 条 ready / true。未发现区间重复新增 queue 事件。

未入库候选：

- HibiChStudio：13 个未入库 ID 为其他衣物/床品收纳袋、收纳箱或衣物罩，与已核验 Wall & Door Organizers 路线不符，未通过卡片分类初筛，未宣称详情或视觉核验通过。
- MiawoodStudio：[1669452239](https://www.etsy.com/listing/1669452239) 卡片为 Acrylic Bridal Gown Hanger，不符合 Wooden Hangers，未入库。
- Chtte 当前 14 个 ID、ChicDecorHK 贝壳首饰分区 22 个 ID、NinaJiaStudio 24 个 ID 均已知；没有重复入队。11:21 与 23:31 UTC 两轮无新增筛查分别见[11时记录](https://github.com/Sailin09/Store-Promotion/blob/main/operations/replenishment/cloud-run-20261119-112132.json)、[夜间记录](https://github.com/Sailin09/Store-Promotion/blob/main/operations/replenishment/cloud-run-20261119-233149.json)。这些不是成功补货事件。

## 当前各路线库存与缺口

数据时点：2026-11-20T02:00:32.308822Z；共 32 条有效路线，统一 **target=3**。原 SQL/库存报告使用 target=7，本日报仅重算缺口，未修改脚本或映射。

| 店铺 | 账号 | usable | 缺口 |
|---|---|---:|---:|
| ChicDecorHK | P4 | 0 | 3 |
| Chtte | P3 | 0 | 3 |
| HibiChStudio | P2 | 0 | 3 |
| NinaJiaStudio | P5 | 0 | 3 |
| Adamideal | P2 | 2 | 1 |
| ChicDecorHK | P1 | 2 | 1 |
| Chtte | P1 | 2 | 1 |
| MiawoodStudio | P2 | 2 | 1 |
| QuGifts | P4 | 2 | 1 |
| AmyHomeCrafts | P1 | 3 | 0 |
| beou | P1 | 3 | 0 |
| CellaHo | P3 | 3 | 0 |
| CustomCurtainsStudio | P1 | 3 | 0 |
| DanyHomeDesign | P1 | 3 | 0 |
| FrenchStyleDecor | P1 | 3 | 0 |
| GavinHome | P1 | 3 | 0 |
| HeyDream | P1 | 3 | 0 |
| KoltCraftStudio | P2 | 3 | 0 |
| KorusStore | P1 | 3 | 0 |
| LambertHouse | P2 | 3 | 0 |
| LoomGoStudio | P3 | 3 | 0 |
| MiraKiuStudio | P1 | 3 | 0 |
| NiceCraftStudioHK | P1 | 3 | 0 |
| NngGoods | P5 | 3 | 0 |
| Parkermo | P1 | 3 | 0 |
| PearlsTreasuresArt | P4 | 3 | 0 |
| ShirieHomeShow | P1 | 3 | 0 |
| SobiaStudio | P1 | 3 | 0 |
| StellaGoodsGifts | P1 | 3 | 0 |
| TunaMunStudio | P1 | 3 | 0 |
| WOGOL | P1 | 3 | 0 |
| WoodHomeLiang | P2 | 3 | 0 |
| **合计** | **32 条路线** | **79** | **17** |

## 未解决事项、修复与首次跟进

- P3 的 uncertain / pin_response_503 与配置不满足问题如上，均保留原始记录；本日报未修复、重置或重试发布。
- [晚间 Cloud promotion operations job 135905109818](https://github.com/Sailin09/Store-Promotion/actions/runs/44621733253/job/135905109818) 在 2026-11-19 21:44:48 UTC 的 cloud-report 步骤输出 “Cloud report failed”，退出码 1；根因未确认。artifact 上传完成不等于报告业务成功，也没有证据证明该错误已修复。
- 随后的[库存报告 job 135964627409](https://github.com/Sailin09/Store-Promotion/actions/runs/44638875582/job/135964627409)确实生成库存 Issue 更新，但属于另一执行，不能据此认定晚间错误已修复。其 target=7 缺口 142 不与本日报 target=3 缺口 17 混用。
- 区间补货脚本入库失败 0；未发现本区间可证实的代码修复。当前发布调度 active=true、*/5 * * * *；启用状态不保证每次都成功。
- first-deficit-followup.json 原状态 **completed**（2026-10-23 首轮 2 条、重跑 0 条），未修改、未重新报告为首次完成。长期补货和既有修复安排保持原样。

## 截止后事件与投递

截至数据库数据时间，未检出 published_at ≥ 本次截止的新 Pin；未检出截止后的新增补货 queue 事件。后续发生的事件属于下一份日报。

本日报仅执行只读核验和日报文件/评论写入；没有触发发布、补货、入队、修复或修改任何任务。完整正文保存至 [daily-report-2026-11-20.md](https://github.com/Sailin09/Store-Promotion/blob/main/operations/replenishment/daily-report-2026-11-20.md)，配套证据为 [daily-report-2026-11-20.json](https://github.com/Sailin09/Store-Promotion/blob/main/operations/replenishment/daily-report-2026-11-20.json)；本聊天与 Issue #2 使用同一正文。
