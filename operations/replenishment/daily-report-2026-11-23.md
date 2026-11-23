# 执行日报 2026-11-23
<!-- store-promotion-daily:2026-11-23 -->

本区间目前可由真实数据库发布时间确认 **6 个新增 Pin**，并有 **5 条真实新增补货素材**。5 条素材首次入库 **5、失败0**，实际幂等重跑 **inserted=0**；自动 Verify 曾确认5条均为 **ready / snapshot_matches=true / source_matches=true**。最新 target=3 库存计划为 **32条路线、usable 74、缺口22**。但发布历史快照只覆盖到 2026-11-22 22:28:28 UTC，截止前最后3小时31分32秒的发布记录未获新快照，故本日报明确标记该段及最终区间Pin总数为**未确认**，不把已确认的6条冒充完整区间总数。

## 区间、时间与证据覆盖

- 逻辑区间：北京时间 **2026-11-22 10:00（含）—2026-11-23 10:00（不含）**；UTC **2026-11-22T02:00:00Z—2026-11-23T02:00:00Z**。承接上一份成功日报的截止时间 **2026-11-22T02:00:00Z**，没有使用历史累计62条作为每日基线。
- 实际核验时间：**2026-11-23 10:01:10 +08:00**，比逻辑截止晚 **1分10秒**。
- 本次 GitHub 连接器已确认可访问仓库；最新 main commit 为 [820d835](https://github.com/Sailin09/Store-Promotion/commit/820d8352336e1eeb747cdf586bf1227cfae6ef7a)。读取了当前证据目录、区间4份 cloud-run、区间 batch、日报状态、首次缺口跟进状态、云端运营文档、店铺注册表、replenishment plan SQL、发布/补货/Verify 工作流与实际 job 日志。
- Issue #2 全部 **175条评论**已读取；未找到 `store-promotion-daily:2026-11-23` 标记，因此本次应新增当日日报评论。按标题搜索找到[发布复核 Issue #3](https://github.com/Sailin09/Store-Promotion/issues/3)，正文已读取，相关评论 **0条**。
- 最新只读 [Verify Supabase Data run 45016861552 / attempt 3 / job 137394250369](https://github.com/Sailin09/Store-Promotion/actions/runs/45016861552/job/137394250369) 成功完成于 **2026-11-22T23:20:36.904Z**（北京时间11月23日07:20:36.904），距逻辑截止 **2小时39分23秒**。它是 push 事件；工作流中的“Inspect Pinterest queue without changing data”和“Inspect database scheduler and actual publication health”两步被条件跳过，只执行了基础数据库检查及 replenishment_plan。最新计划数据因此是库存核验时点值，不是10:00的实时快照。
- 最新可用发布历史快照来自 [Cloud promotion operations run 45077859592 / job 137379140030](https://github.com/Sailin09/Store-Promotion/actions/runs/45077859592/job/137379140030)，核验时间 **2026-11-22T22:28:28.003911Z**（北京时间11月23日06:28:28.003911），距逻辑截止 **3小时31分31.996秒**。对应 [Issue #2 评论 7086843364](https://github.com/Sailin09/Store-Promotion/issues/2#issuecomment-7086843364)包含各账号自基线以来的完整 Pin 列表；本日报按真实 published_at 过滤本区间，只计唯一 Pin ID。
- 最新 Verify 没有重新核验发布历史，且本次可用 GitHub 连接器只暴露对失败/取消 job 的重跑能力，没有 workflow_dispatch 操作；成功的 Verify job 无法通过现有动作触发新的只读运行。因此 **22:28:28Z—02:00:00Z 发布历史覆盖不完整**，各账号的最终区间总数均不能确认。后续事件若发生在逻辑截止之后，也不计入本区间。
- Actions 最近100条运行记录覆盖本区间10个相关 workflow runs，最早为11月22日03:10Z；没有证据证明03:10Z以前或22:28:28Z之后的业务事件完整。日志覆盖不足的部分均标为未确认。

## 逐账号真实新增 Pin 与待处理状态

下表“已确认新增”只统计截至22:28:28Z快照中、published_at落入本区间的唯一 Pin。**22:28:28Z之后至10:00的数量未确认**，所以“0已确认”不等于最终区间0。

| 账号 / handle | 已确认新增 Pin | 最新快照 ready/scheduled | 未决失败 / 待处理 |
|---|---:|---:|---|
| P1 / icyndizhang | 2；截止后段未确认 | 52 | 未见该账号未决尝试；后续发布历史未确认 |
| P2 / sailing_981 | 2；截止后段未确认 | 12 | 未见该账号未决尝试；后续发布历史未确认 |
| P3 / mydecorshop | 0；截止后段未确认 | 6 | 1条 uncertain，`pin_response_503`，无 Pin ID，仍未解决 |
| P4 / cindyzhang62 | 1；截止后段未确认 | 1 | 未见该账号未决尝试；后续发布历史未确认 |
| P5 / ivy5205 | 1；截止后段未确认 | 3 | 未见该账号未决尝试；后续发布历史未确认 |

ready/scheduled 数量来自22:28:28Z云端快照，是当时队列状态，不等于当天可发布数量，也不是10:00的实时值。

| 账号 | 店铺 | Etsy商品 | Pin链接 | published_at（UTC） |
|---|---|---|---|---|
| P1 | FrenchStyleDecor | [1271672587](https://www.etsy.com/listing/1271672587) | [801218590009956000](https://www.pinterest.com/pin/801218590009956000/) | 2026-11-22T02:05:02.494352+00:00 |
| P2 | LambertHouse | [1793865537](https://www.etsy.com/listing/1793865537) | [863494928599724283](https://www.pinterest.com/pin/863494928599724283/) | 2026-11-22T02:10:02.538882+00:00 |
| P5 | NngGoods | [4557856544](https://www.etsy.com/listing/4557856544) | [713820609738095796](https://www.pinterest.com/pin/713820609738095796/) | 2026-11-22T02:45:02.726884+00:00 |
| P1 | GavinHome | [1603158829](https://www.etsy.com/listing/1603158829) | [801218590009962507](https://www.pinterest.com/pin/801218590009962507/) | 2026-11-22T13:00:04.743568+00:00 |
| P2 | MiawoodStudio | [1863104922](https://www.etsy.com/listing/1863104922) | [863494928599730508](https://www.pinterest.com/pin/863494928599730508/) | 2026-11-22T13:05:02.158958+00:00 |
| P4 | PearlsTreasuresArt | [4339512567](https://www.etsy.com/listing/4339512567) | [675399275415036424](https://www.pinterest.com/pin/675399275415036424/) | 2026-11-22T13:55:02.391137+00:00 |

**未发布 / 失败 / 待处理**

- P3 / Chtte：queue_id `35c31472-0b55-4f6d-bd70-eb336463ee80`，attempt_id `c6bd08a5-afc4-495c-a309-8482d88efefb`，状态 **uncertain**，错误 `pin_response_503`，没有 pin_id / publish_history。仍按未知结果保留，不自动重试、不清除记录。
- P1/P2/P4/P5：快照未列出未决发布尝试；其 ready/scheduled 队列仍受发布窗口、店铺间隔、账号规则和图片/快照复核约束。不能把队列数当成发布成功数。
- 区间3次 GitHub Run Pinterest publisher 均为绿色 workflow，但实际 job 均返回 `idle / outside_publish_window`、`published=0`：[run 44995591212 / job 137125806134](https://github.com/Sailin09/Store-Promotion/actions/runs/44995591212/job/137125806134)、[run 45037705494 / job 137255023324](https://github.com/Sailin09/Store-Promotion/actions/runs/45037705494/job/137255023324)、[run 45074057118 / job 137367219073](https://github.com/Sailin09/Store-Promotion/actions/runs/45074057118/job/137367219073)。这些 idle 运行不计作发布；上表6条来自真实发布历史快照。

## 区间真实新增补货素材

本区间只有一份新批次： [batch-20261122-051903.json](https://github.com/Sailin09/Store-Promotion/blob/main/operations/replenishment/batch-20261122-051903.json)，对应[云端审核证据](https://github.com/Sailin09/Store-Promotion/blob/main/operations/replenishment/cloud-run-20261122-051903.json)。

- 首次入库：[Replenish verified stock run 44988950045 / job 137105705490](https://github.com/Sailin09/Store-Promotion/actions/runs/44988950045/job/137105705490)：**inserted=5、failed=0、skipped_existing=0**。
- 实际幂等重跑：同一 job 的“Verify idempotent retry”步骤返回 **inserted=0 / no_new_verified_material**。
- 自动后续 Verify：[run 44989031021 / job 137105817199](https://github.com/Sailin09/Store-Promotion/actions/runs/44989031021/job/137105817199)，完成时间 **2026-11-22T05:21:31.645833Z**；确认这5条均 `queue_status=ready`、`snapshot_matches=true`、`source_matches=true`。此处为入库后的项目级证据；最新23:20 Verify跳过了队列检查，故不能把05:21的逐条状态冒充10:00逐条复核。

| shop / Etsy商品 | account / handle | Board名称 / ID | queue_id | 状态 | 来源、视觉核验及入库 |
|---|---|---|---|---|---|
| FrenchStyleDecor · [1884132251](https://www.etsy.com/listing/1884132251/embroidered-white-cotton-apron-with-lace) | P1 / icyndizhang | CyndiZhangStudio / 801218658646993070 | `a00b7693-de90-4ed9-9965-59db15dd2c0b` | ready / true | [原主图](https://i.etsystatic.com/33874695/r/il/b2f1d8/6742833257/il_794xN.6742833257_qnfj.jpg)；checked_at 2026-11-22T05:19:03.666Z；实际截图见白色刺绣围裙、荷叶边肩带和褶裙；卖家匹配、主 Add to cart 启用；首次 inserted=1。 |
| KoltCraftStudio · [1883988142](https://www.etsy.com/listing/1883988142/camphor-wooden-coat-hangers-natural-wood) | P2 / sailing_981 | storage / 863494997243989843 | `77ed2a8d-5b5a-4e97-9b43-7d0406ff3bca` | ready / true | [原主图](https://i.etsystatic.com/43671795/r/il/91f13f/6814868481/il_794xN.6814868481_1njb.jpg)；checked_at 2026-11-22T05:19:03.750Z；实际截图见两只浅棕木衣架、明显木纹、下横杆和金属钩；卖家匹配、主 Add to cart 启用；首次 inserted=1。 |
| KorusStore · [4405714144](https://www.etsy.com/listing/4405714144/olive-green-chenille-curtains-rustic) | P1 / icyndizhang | CyndiZhangStudio / 801218658646993070 | `7da400e0-ef80-4299-ad4c-e5df3b5e9d4c` | ready / true | [原主图](https://i.etsystatic.com/35854701/r/il/3e7db4/7449401039/il_794xN.7449401039_hsmp.jpg)；checked_at 2026-11-22T05:19:03.808Z；实际截图见橄榄绿织物纹理及厚实竖褶；选 Olive Green、W39×L51 inches / 1 PC；卖家匹配、主 Add to cart 启用；首次 inserted=1。 |
| LambertHouse · [4314290016](https://www.etsy.com/listing/4314290016/aluminum-alloy-clothes-hangers-heavy) | P2 / sailing_981 | storage / 863494997243989843 | `1197e897-2e8b-4717-a861-6dd4323fbcb5` | ready / true | [原主图](https://i.etsystatic.com/46944744/r/il/3bb878/6907941064/il_794xN.6907941064_p87f.jpg)；checked_at 2026-11-22T05:19:03.842Z；实际截图见灰色金属衣架、弯钩、肩部凹槽和下横杆；选 C01 / 10 PCS；卖家匹配、主 Add to cart 启用；首次 inserted=1。 |
| NngGoods · [4537650021](https://www.etsy.com/listing/4537650021/clear-quartz-cabinet-knob-crystal-drawer) | P5 / ivy5205 | Furniture / 713820678377803412 | `9ba68eb6-f9f9-4154-ba9d-ad4dc3f01915` | ready / true | [原主图](https://i.etsystatic.com/57194200/r/il/288b9e/8429768318/il_794xN.8429768318_jxzs.jpg)；checked_at 2026-11-22T05:19:03.893Z；实际截图见不规则透明旋钮顶部、内部纹理及黄铜色圆柱底座；选1 Pcs；卖家匹配、主 Add to cart 启用；首次 inserted=1。 |

五条均在真实远程 CDP 中打开商品详情和原始主图截图；没有用搜索摘要、alt 或 HTTP 200 替代视觉核验。均未实际点击购物车。批次总计首次 inserted=5、retry inserted=0、failed=0，5个 queue_id 唯一。详细卖家、选项、截图观察、时间与证据保存在 batch 和 cloud-run 文件中。

**未入库候选（不计成功）**

- HibiChStudio：`4420842205`、`4454344966`、`4559057618`、`4559038359`、`4559062406`、`4559684799`、`4420844641`、`4473116090`、`4473114318`、`4420839477`、`4517906376`、`4517885823`、`4454347860`。当前店面标题主要是其他床品/衣物收纳袋、箱、篮或罩，未建立 Wall & Door Organizers 精确分类匹配；未通过详情与视觉审核。
- MiawoodStudio：`1669452239` 是亚克力婚纱衣架，不符合 Wooden Hangers。
- QuGifts：`4399009375`、`4536203754`、`4536206015`、`4535556837` 分别涉及木珠门帘/隔断、餐具或包饰；未建立 Coastal Home Decor / Wall Decor 的准确分类及完整审核。
- 后续 [cloud-run 20261122-112106](https://github.com/Sailin09/Store-Promotion/blob/main/operations/replenishment/cloud-run-20261122-112106.json)、[171454](https://github.com/Sailin09/Store-Promotion/blob/main/operations/replenishment/cloud-run-20261122-171454.json)、[232039](https://github.com/Sailin09/Store-Promotion/blob/main/operations/replenishment/cloud-run-20261122-232039.json) 均因本轮没有可用远程 CDP 控制能力/不能完成实时详情和截图核验而停止在发现或审核前，没有写新 batch、没有触发入库。它们不是“候选为0”或补货成功。

## 最新库存与缺口（核验时点值）

最新 Verify 的 replenishment_plan 时间 **2026-11-22T23:20:36.904Z**；SQL 与本次新日志均明确 **target=3**。32条有效店铺/账号路线，usable合计 **74**，总缺口 **22**。优先级先列 usable=0，再列低库存。

| 店铺 | 账号 / handle | usable / target | deficit |
|---|---|---:|---:|
| ChicDecorHK | P4 / cindyzhang62 | 0 / 3 | 3 |
| Chtte | P3 / mydecorshop | 0 / 3 | 3 |
| HibiChStudio | P2 / sailing_981 | 0 / 3 | 3 |
| MiawoodStudio | P2 / sailing_981 | 0 / 3 | 3 |
| NinaJiaStudio | P5 / ivy5205 | 0 / 3 | 3 |
| PearlsTreasuresArt | P4 / cindyzhang62 | 0 / 3 | 3 |
| QuGifts | P4 / cindyzhang62 | 1 / 3 | 2 |
| Chtte | P1 / icyndizhang | 2 / 3 | 1 |
| GavinHome | P1 / icyndizhang | 2 / 3 | 1 |
| Adamideal | P2 / sailing_981 | 3 / 3 | 0 |
| AmyHomeCrafts | P1 / icyndizhang | 3 / 3 | 0 |
| beou | P1 / icyndizhang | 3 / 3 | 0 |
| CellaHo | P3 / mydecorshop | 3 / 3 | 0 |
| ChicDecorHK | P1 / icyndizhang | 3 / 3 | 0 |
| CustomCurtainsStudio | P1 / icyndizhang | 3 / 3 | 0 |
| DanyHomeDesign | P1 / icyndizhang | 3 / 3 | 0 |
| FrenchStyleDecor | P1 / icyndizhang | 3 / 3 | 0 |
| HeyDream | P1 / icyndizhang | 3 / 3 | 0 |
| KoltCraftStudio | P2 / sailing_981 | 3 / 3 | 0 |
| KorusStore | P1 / icyndizhang | 3 / 3 | 0 |
| LambertHouse | P2 / sailing_981 | 3 / 3 | 0 |
| LoomGoStudio | P3 / mydecorshop | 3 / 3 | 0 |
| MiraKiuStudio | P1 / icyndizhang | 3 / 3 | 0 |
| NiceCraftStudioHK | P1 / icyndizhang | 3 / 3 | 0 |
| NngGoods | P5 / ivy5205 | 3 / 3 | 0 |
| Parkermo | P1 / icyndizhang | 3 / 3 | 0 |
| ShirieHomeShow | P1 / icyndizhang | 3 / 3 | 0 |
| SobiaStudio | P1 / icyndizhang | 3 / 3 | 0 |
| StellaGoodsGifts | P1 / icyndizhang | 3 / 3 | 0 |
| TunaMunStudio | P1 / icyndizhang | 3 / 3 | 0 |
| WOGOL | P1 / icyndizhang | 3 / 3 | 0 |
| WoodHomeLiang | P2 / sailing_981 | 3 / 3 | 0 |
| **合计** | **32条路线** | **74 usable** | **22** |

- usable=0共6条路线，缺口18；低库存3条路线（QuGifts、Chtte/P1、GavinHome），缺口4。
- Chtte/P3仍为0/3，分类为 Chair Cushions & Seat Pads，Board为 Kitchen & Dining（499618221101215211）；旧布料 listing `4325858718` 仍在 known_listing_ids 中且不可复用。Chtte/P1为2/3，未与P3复用 listing ID。
- cloud-run 051903的入库后自动 Verify 使用了当时旧版 target=7；随后 target 口径已修正。当前库存**只使用最新23:20 Verify明确输出的target=3**，不混用旧target=7结果。
- Issue #2 的22:28库存报告正文仍出现“按7条目标”的文字标签，但它与当前 SQL 和最新 Verify 的 target=3 不一致；本日报采用最新 SQL / Verify 的 target=3，已将该标签差异保留为数据质量问题，不擅自修改工作流。

## 重复、失败、修复与未解决事项

- 补货：区间真实新增5条；首次 inserted=5、failed=0、skipped_existing=0；幂等重跑 inserted=0；未发现重复 queue_id。
- 已修复：`scripts/replenishment-plan.sql` 的 target/deficit 口径已由旧值修正为3；最新 Verify 日志的32条路线全部输出 target=3，确认修正生效。本日报没有修改代码或触发修复。
- 未解决：P3/Chtte 的 `pin_response_503` uncertain 尝试仍在；结果不确定，未重试。
- 未解决：Cloud promotion operations run 45066486329 / job 137343808931 于 **2026-11-22T20:27:46Z** 的 evening 模式报告失败，退出码1，日志只给出“Cloud report failed”；根因未确认。随后 [run 45077859592 / job 137379140030](https://github.com/Sailin09/Store-Promotion/actions/runs/45077859592/job/137379140030) 的 stock 模式成功更新库存报告，但这不能证明 evening 报告故障已修复。
- 云端库存报告：03:11Z旧口径曾报 deficit=152；13:21Z报告 deficit=21；22:28Z报告 deficit=22。03:11Z旧口径值不与当前target=3计划混算。
- 后续三次新品发现运行缺少可用远程 CDP 控制能力，未能进入当前店面和商品详情，也未能查看主图；没有新增候选审核或入库。未用HTTP 200、workflow success或idle替代业务成功。
- `first-deficit-followup.json` 状态仍为 **completed**，历史首轮 inserted=2、实际重跑0；本日报未改写。长期补货任务继续保留。
- 本日报仅做只读核验、保存日报及Issue #2评论；没有触发发布、补货、入队、修复、重置历史、修改发布/补货/跟进任务，也没有修改本地任务或heartbeat。

## 本次报告文件与投递

本日报完整正文同时保存为 [daily-report-2026-11-23.md](https://github.com/Sailin09/Store-Promotion/blob/main/operations/replenishment/daily-report-2026-11-23.md)，配套机器可读证据为 [daily-report-2026-11-23.json](https://github.com/Sailin09/Store-Promotion/blob/main/operations/replenishment/daily-report-2026-11-23.json)。Issue #2评论使用同一份 Markdown 正文；日报成功投递后才更新 `cloud-daily-report-state.json` 的逻辑截止与 comment_id。
