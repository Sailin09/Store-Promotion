# 执行日报 2026-11-02

<!-- store-promotion-daily:2026-11-02 -->

统计区间：**北京时间2026-11-01 10:00（含）至2026-11-02 10:00（不含）**，即UTC 2026-11-01 02:00至2026-11-02 02:00，续接上一次成功日报截止。

实际数据库核验：**北京时间2026-11-02 10:00:19.553**（UTC 2026-11-02T02:00:19.553732+00:00），比逻辑截止晚约20秒；正文整理与投递在其后。当前库存为核验时点值，区间新增按真实published_at及queue.created_at计数。截止后至该核验时点无新增Pin，其后事件不计本区间。

本区间确认**新增Pin 13条、真实补货入库12条**。两轮分别新增7条和5条、失败均0，实际幂等重跑各inserted=0。当前**可用82条、缺口14条**，尚未补齐。本日报只读汇报业务，未触发发布、补货、入队、业务修复或修改相关任务；workflow success、HTTP200 idle、零入队均不替代业务成功。

### 逐账号汇总

| 账号 | 区间新增Pin | 当前usable | 当前缺口（target=3） | 草稿 / 有图草稿 |
|---|---:|---:|---:|---|
| P1 icyndizhang | 3 | 50 | 4 | 55 / 0 |
| P2 sailing_981 | 3 | 14 | 4 | 26 / 0 |
| P3 mydecorshop | 2 | 5 | 4 | 4 / 3 |
| P4 cindyzhang62 | 3 | 8 | 1 | 0 / 0 |
| P5 ivy5205 | 2 | 5 | 1 | 0 / 0 |

五账号均active、OAuth已连接，状态authorized_trial；发布设置enabled、access_tier=standard。P3、P5各确认2条，其余各3条；完整历史未见P3、P5第三条区间发布记录，具体未触发原因未确认，不能仅因数量少认定失败。

### P1 · icyndizhang：新增3条

| 北京时间 | 店铺 / Etsy商品 | 实际Pin |
|---|---|---|
| 2026-11-01 10:05:02 | beou [1316301617](https://www.etsy.com/listing/1316301617) | [801218590009599215](https://www.pinterest.com/pin/801218590009599215/) |
| 2026-11-01 21:00:04 | WOGOL [4556660960](https://www.etsy.com/listing/4556660960) | [801218590009605203](https://www.pinterest.com/pin/801218590009605203/) |
| 2026-11-02 08:00:04 | CustomCurtainsStudio [1513221839](https://www.etsy.com/listing/1513221839) | [801218590009613605](https://www.pinterest.com/pin/801218590009613605/) |

### P2 · sailing_981：新增3条

| 北京时间 | 店铺 / Etsy商品 | 实际Pin |
|---|---|---|
| 2026-11-01 10:10:02 | Adamideal [4528768933](https://www.etsy.com/listing/4528768933) | [863494928599393884](https://www.pinterest.com/pin/863494928599393884/) |
| 2026-11-01 21:05:02 | KoltCraftStudio [1753876451](https://www.etsy.com/listing/1753876451) | [863494928599398695](https://www.pinterest.com/pin/863494928599398695/) |
| 2026-11-02 08:05:01 | MiawoodStudio [1877279919](https://www.etsy.com/listing/1877279919) | [863494928599407592](https://www.pinterest.com/pin/863494928599407592/) |

### P3 · mydecorshop：新增2条

| 北京时间 | 店铺 / Etsy商品 | 实际Pin |
|---|---|---|
| 2026-11-01 21:45:02 | CellaHo [4512460627](https://www.etsy.com/listing/4512460627) | [499618152434303291](https://www.pinterest.com/pin/499618152434303291/) |
| 2026-11-02 09:05:02 | LoomGoStudio [4555451011](https://www.etsy.com/listing/4555451011) | [499618152434307293](https://www.pinterest.com/pin/499618152434307293/) |

### P4 · cindyzhang62：新增3条

| 北京时间 | 店铺 / Etsy商品 | 实际Pin |
|---|---|---|
| 2026-11-01 10:55:01 | QuGifts [4318133912](https://www.etsy.com/listing/4318133912) | [675399275414696219](https://www.pinterest.com/pin/675399275414696219/) |
| 2026-11-01 22:00:03 | ChicDecorHK [1170123268](https://www.etsy.com/listing/1170123268) | [675399275414701621](https://www.pinterest.com/pin/675399275414701621/) |
| 2026-11-02 08:55:02 | PearlsTreasuresArt [1853584450](https://www.etsy.com/listing/1853584450) | [675399275414710436](https://www.pinterest.com/pin/675399275414710436/) |

### P5 · ivy5205：新增2条

| 北京时间 | 店铺 / Etsy商品 | 实际Pin |
|---|---|---|
| 2026-11-01 22:05:02 | NinaJiaStudio [4477929531](https://www.etsy.com/listing/4477929531) | [713820609737736940](https://www.pinterest.com/pin/713820609737736940/) |
| 2026-11-02 09:00:02 | NngGoods [4582960271](https://www.etsy.com/listing/4582960271) | [713820609737747160](https://www.pinterest.com/pin/713820609737747160/) |

13个Pin ID唯一，均由无LIMIT的publish_history published记录证明，逐条关联publication及商品，并由新日志的唯一商品归属确认店铺；对应error均空、snapshot_matches均true。昨日10时窗口3条、**昨晚北京时间21:00–23:00窗口5条**、今早08时窗口5条。未使用历史累计62条作每日基线。

### 区间全部真实补货：12条

以下12个唯一queue_id的created_at均在区间内；当前全部**ready、snapshot_matches=true、source_matches=true、eligible_configuration=true**，尚未发布。区间新建储备亦为12条，与两份batch及逐件inserted=1日志一致。入库不等于Pin发布。

| 店铺 / Etsy商品 | 账号 | Board名称 / ID | queue_id | 入库北京时间 | 状态 / snapshot |
|---|---|---|---|---|---|
| Adamideal [4539298563](https://www.etsy.com/listing/4539298563/walnut-wood-cd-stand-vinyl-record) | P2 sailing_981 | storage / 863494997243989843 | ec8be4d0-7ad3-43be-ad2b-a05a46273bb4 | 2026-11-01 13:21:15 | ready / true |
| beou [4553569611](https://www.etsy.com/listing/4553569611/rustic-chair-cushion-with-ties-square) | P1 icyndizhang | CyndiZhangStudio / 801218658646993070 | 34d5ec18-90a9-42ef-9670-324605fa3c9c | 2026-11-01 13:21:17 | ready / true |
| LambertHouse [4548309153](https://www.etsy.com/listing/4548309153/solid-wood-multi-hook-hanger-closet) | P2 sailing_981 | storage / 863494997243989843 | 656eeaae-bcc0-43c9-a4f8-bd82f7d697e7 | 2026-11-01 13:21:17 | ready / true |
| LoomGoStudio [4574330962](https://www.etsy.com/listing/4574330962/cream-butterfly-jacquard-fabric-satin) | P3 mydecorshop | Home Decor / 499618221101238533 | 84b546c3-3d48-4c04-92f0-6fdc4a7b4722 | 2026-11-01 13:21:18 | ready / true |
| NngGoods [4562360655](https://www.etsy.com/listing/4562360655/natural-crystal-drawer-knob-raw-stone) | P5 ivy5205 | Furniture / 713820678377803412 | 3b71138b-9b84-422c-9536-d984722aa6d0 | 2026-11-01 13:21:20 | ready / true |
| PearlsTreasuresArt [4339515708](https://www.etsy.com/listing/4339515708/handmade-seashell-pendant-necklace) | P4 cindyzhang62 | 名称未确认 / 675399344058025061 | 7bbaf250-2c18-459c-9e38-51ce014f3b2f | 2026-11-01 13:21:21 | ready / true |
| QuGifts [4549007373](https://www.etsy.com/listing/4549007373/natural-shell-wind-chime-wooden-branch) | P4 cindyzhang62 | 名称未确认 / 675399344056772225 | c825f586-77c3-4fc8-9cb8-f48682d2af8d | 2026-11-01 13:21:21 | ready / true |
| CellaHo [4477287827](https://www.etsy.com/listing/4477287827/white-cotton-embroidered-floral-fabric) | P3 mydecorshop | Home Decor / 499618221101238533 | 40c11b3a-14b2-471c-a7ff-54c2e251e357 | 2026-11-02 01:16:27 | ready / true |
| ChicDecorHK [1864481074](https://www.etsy.com/listing/1864481074/gold-plated-seashell-pendant-necklace) | P4 cindyzhang62 | 名称未确认 / 675399344058025061 | 1267b748-96fe-4988-9634-63ccc94442b0 | 2026-11-02 01:16:28 | ready / true |
| KoltCraftStudio [1841054169](https://www.etsy.com/listing/1841054169/walnut-wood-hanger-with-brass-hook) | P2 sailing_981 | storage / 863494997243989843 | e1f9bfe0-adea-47de-a4e6-97e1bd160b44 | 2026-11-02 01:16:32 | ready / true |
| NinaJiaStudio [4477915577](https://www.etsy.com/listing/4477915577/magpie-makeup-bag-large-travel-cosmetic) | P5 ivy5205 | 名称未确认 / 713820678377803445 | af242ace-85de-4784-b48b-ddf7bd1898bc | 2026-11-02 01:16:34 | ready / true |
| WOGOL [4438780453](https://www.etsy.com/listing/4438780453/linen-striped-curtains-with-valance) | P1 icyndizhang | CyndiZhangStudio / 801218658646993070 | 672a7daa-30d3-4926-b04a-060c054aaa7d | 2026-11-02 01:16:36 | ready / true |

未确认的Board名称不猜测；原入库工作流核验实时账号及公有Board归属，沿用既有ID，不改映射。

**第一轮：北京时间11月1日13:21，实际新增7条。** [批次052023](https://github.com/Sailin09/Store-Promotion/blob/main/operations/replenishment/batch-20261101-052023.json)；[run41276578731/job124759923718](https://github.com/Sailin09/Store-Promotion/actions/runs/41276578731/job/124759923718)：首次inserted=7、failed=0、pending=7；13:21:21第二次实际执行返回no_new_verified_material、inserted=0。库存80→87、缺口16→9；[当时独立Verify job124760026859](https://github.com/Sailin09/Store-Promotion/actions/runs/41276637399/job/124760026859)及[本轮证据](https://github.com/Sailin09/Store-Promotion/blob/main/operations/replenishment/cloud-run-20261101-051507.json)保存队列结果。

**第二轮：北京时间11月2日01:16，实际新增5条。** [批次171519](https://github.com/Sailin09/Store-Promotion/blob/main/operations/replenishment/batch-20261101-171519.json)；[run41330552735/job124919656383](https://github.com/Sailin09/Store-Promotion/actions/runs/41330552735/job/124919656383)：首次inserted=5、failed=0、pending=5；01:16:37第二次实际执行返回no_new_verified_material、inserted=0。库存82→87、缺口14→9；[当时独立Verify job124919825163](https://github.com/Sailin09/Store-Promotion/actions/runs/41330649087/job/124919825163)及[本轮证据](https://github.com/Sailin09/Store-Promotion/blob/main/operations/replenishment/cloud-run-20261101-171143.json)保存队列结果。

本日报重新读取两轮完整实际入库job日志，逐件inserted=1合计12、失败0、实际重跑各0。pending为当次待处理输入数，已由独立数据库确认入队ready。没有重新执行入库，没有将10月23日首次2条或其他历史全量批次计入本区间。

### 来源与实际视觉核验

以下为补货时原始现场证据；本日报未访问Etsy、未刷新checked_at。每件均从登记店铺当时当前storefront发现，先排除全部known_listing_ids，再进入真实详情核验卖家、分类、可售选项及启用的Add to cart，并实际查看远程CDP主图。截图现场显示检查，未声称归档截图二进制；不以alt、摘要或HTTP状态替代视觉核验，未提交运输电话或购买。完整原始英文证据保存在batch及配套JSON。

- **Adamideal / 4539298563**：北京时间2026-11-01 13:16:39；Desk Organization；visual_verified=true。深木色长方底座配斜向金色支杆，承托一台木侧板CD播放器作展示道具；选Beech Wood、CD Stand、数量1。图片道具不视为随附商品，图片深木色不冒充所选榉木；不认证木种、金属纯度或兼容性。 [原图](https://i.etsystatic.com/35172699/r/il/2a0884/8263006542/il_794xN.8263006542_misy.jpg)。

- **beou / 4553569611**：北京时间2026-11-01 13:16:58；Chair Cushions & Seat Pads；visual_verified=true。浅色方形织纹座垫带角部绑带，置于浅木桌面，图中标B01；选16×16英寸/40×40厘米、B01、数量1。选款后实际查看对应变体原图，不承诺成分、厚度、防滑或舒适效果。 [原图](https://i.etsystatic.com/31778838/r/il/002bc6/8413722131/il_794xN.8413722131_pxiq.jpg)。

- **LambertHouse / 4548309153**：北京时间2026-11-01 13:17:29；Closet Organization；visual_verified=true。两件深木色顶杆配黑色矩形金属框及上弯挂钩，悬于白色衣柜杆，展示腰带和布艺配件；选2 PCS、Vintage、订单数量1。不认证木种、承重或旋转耐用性，配件不视作随附。 [原图](https://i.etsystatic.com/46944744/r/il/291349/8327862772/il_794xN.8327862772_310i.jpg)。

- **LoomGoStudio / 4574330962**：北京时间2026-11-01 13:18:58；Jacquard Fabric；visual_verified=true。奶油色与浅金色褶叠布带蝴蝶及卷曲装饰纹；选1 Yard、订单数量1。真实说明明确含靠垫套、抱枕、桌面及家居装饰用途，沿用Jacquard Fabric路线；不作丝含量、文化产地或性能保证。 [原图](https://i.etsystatic.com/58959935/r/il/ed1430/8815537667/il_794xN.8815537667_6nj7.jpg)。

- **NngGoods / 4562360655**：北京时间2026-11-01 13:19:28；Cabinet Knobs & Pulls；visual_verified=true。浅粉色不规则粗面石状旋钮配金色圆柱底座与螺丝，置于白色木板；选ROSE QUARTZ、1 PCS、订单数量1。不认证宝石真伪、金属纯度、螺丝适配或疗愈效果。 [原图](https://i.etsystatic.com/57194200/r/il/6d0a85/8477772883/il_794xN.8477772883_j3uu.jpg)。

- **PearlsTreasuresArt / 4339515708**：北京时间2026-11-01 13:19:53；Seashell Jewelry；visual_verified=true。黑色背景上，奶白色螺壳吊坠包覆银色珠网，保留卖家水印；选White、数量1。加载完成后实际查看，不作贵金属纯度、防敏或佩戴舒适保证。 [原图](https://i.etsystatic.com/46725934/r/il/2949a7/7090108805/il_794xN.7090108805_4p1c.jpg)。

- **QuGifts / 4549007373**：北京时间2026-11-01 13:20:19；Coastal Home Decor；visual_verified=true。奶油色墙前，弯曲木枝下垂五串半透明白色圆贝片与浅色珠子，保留水印；选Width 20 cm、数量1。大尺寸选项与描述存在测量差异，未复制为尺寸承诺，不承诺音色或户外耐用性。 [原图](https://i.etsystatic.com/38006525/r/il/ad1332/8380962725/il_794xN.8380962725_o9u2.jpg)。

- **CellaHo / 4477287827**：北京时间2026-11-02 01:13:11；Embroidered Fabric；visual_verified=true。白色布上重复竖向刺绣花藤与小花；选0.5 Yards、数量1。真实说明明确含home décor用途，沿用Embroidered Fabric路线；不认证棉含量、宽度或透气性，米/码表述差异留给卖家确认。 [原图](https://i.etsystatic.com/39663062/r/il/1f24f2/7840084960/il_794xN.7840084960_mvdl.jpg)。

- **ChicDecorHK / 1864481074**：北京时间2026-11-02 01:13:58；Seashell Jewelry；visual_verified=true。米白亚麻色展示底上，绿色条纹螺壳吊坠带金色条带和珠状细链；选Green conch、数量1。首次空白截图不计视觉证据，加载后实看；不承诺金纯度、产地、精确链长或防敏。 [原图](https://i.etsystatic.com/32003756/r/il/00c254/5864083625/il_794xN.5864083625_rlbh.jpg)。

- **KoltCraftStudio / 1841054169**：北京时间2026-11-02 01:14:23；Wooden Hangers；visual_verified=true。深色木面上两只弧形棕色木衣架配修长金色挂钩；选1 PCS、数量1，图片两件不视为售卖一对。不承诺胡桃木种、黄铜纯度、防滑、防锈、承重或衣物保护效果。 [原图](https://i.etsystatic.com/43671795/r/il/7d4f47/6565473115/il_794xN.6565473115_7a9v.jpg)。

- **NinaJiaStudio / 4477915577**：北京时间2026-11-02 01:14:51；Cosmetic Bags；visual_verified=true。白桌上直立绿色鸟花纹拉链包与敞开的粉色花纹包，内有化妆品道具；选green、数量1。主图多配色不当套装，不承诺容量、防水、成分认证或耐用性。 [原图](https://i.etsystatic.com/61131894/r/il/3c660c/7892286893/il_794xN.7892286893_c8kp.jpg)。

- **WOGOL / 4438780453**：北京时间2026-11-02 01:15:19；Curtains；visual_verified=true。长款棕与奶白竖条窗帘配深褶同花窗幔，画面由挂环悬于深色杆；选Rod pocket、W59XL71 inch–1 PC、数量1。图片挂法与所选杆袋不同，不声称图片五金随附；不认证麻成分、遮光隐私、耐用性或尺寸适配。 [原图](https://i.etsystatic.com/45174159/r/il/257b62/7587145736/il_794xN.7587145736_p91a.jpg)。

### 零入队轮次、候选与剩余缺口

| 北京时间 / 证据 | 实际新增 | 当时usable / deficit | 事实 |
|---|---:|---|---|
| 11月1日19:16，[111528](https://github.com/Sailin09/Store-Promotion/blob/main/operations/replenishment/cloud-run-20261101-111528.json) | 0 | 87 / 9 | 新只读核验及当前店面发现，符合既有分类的ID均已知，未执行入库或幂等重跑。 |
| 11月2日07:15，[231453](https://github.com/Sailin09/Store-Promotion/blob/main/operations/replenishment/cloud-run-20261101-231453.json) | 0 | 87 / 9 | 新只读核验及当前店面发现，无合格未入库ID，未刷新旧视觉证据。 |

零入队不计补货成功，也不称幂等验证完成。本区间无记录为“已审核但未入库”的新增候选；Hibi另9件收纳袋、箱及衣物罩因不符既有Wall & Door Organizers分类排除。

当前剩余**14条缺口**：Chtte/P1缺3、Chtte/P3缺3、HibiChStudio/P2缺3；CustomCurtainsStudio/P1、LoomGoStudio/P3、MiawoodStudio/P2、NngGoods/P5、PearlsTreasuresArt/P4各缺1。相较07:15核验，今早新增5条发布使库存87→82、缺口9→14；尚待后续受控补货，不能说已补齐，日报不触发补货。

最近现场Chtte全部7款椅垫ID均已知，P3仍为mydecorshop的Kitchen & Dining 499618221101215211、Chair Cushions & Seat Pads；旧布料4325858718不可用，P1/P3不共用商品ID。Hibi16件中原分类7件均已知，不扩分类强行入队。

首次缺口跟进状态仍completed：10月23日首次2条已有真实入库、ready/snapshot及实际零新增重跑证据，属于历史闭环，不计本日报12条，也不表示长期补货结束。

### 当前全部路线库存

核验时点30店铺、32路线，usable合计82、deficit合计14，每路线target仍3。下表是当前库存，不是每日新增数。

| 账号 | 店铺 | usable | deficit |
|---|---|---:|---:|
| P1 | AmyHomeCrafts | 3 | 0 |
| P1 | beou | 3 | 0 |
| P1 | ChicDecorHK | 3 | 0 |
| P1 | Chtte | 0 | 3 |
| P1 | CustomCurtainsStudio | 2 | 1 |
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
| P2 | HibiChStudio | 0 | 3 |
| P2 | KoltCraftStudio | 3 | 0 |
| P2 | LambertHouse | 3 | 0 |
| P2 | MiawoodStudio | 2 | 1 |
| P2 | WoodHomeLiang | 3 | 0 |
| P3 | CellaHo | 3 | 0 |
| P3 | Chtte | 0 | 3 |
| P3 | LoomGoStudio | 2 | 1 |
| P4 | ChicDecorHK | 3 | 0 |
| P4 | PearlsTreasuresArt | 2 | 1 |
| P4 | QuGifts | 3 | 0 |
| P5 | NinaJiaStudio | 3 | 0 |
| P5 | NngGoods | 2 | 1 |

相邻日报核验值对账：**83 + 本区间入库12 − 本区间发布13 = 82**。83为上一日报实际核验时点库存，不能冒充精确截止快照；本次缺口按路线加总14。

### 未发布、失败、修复与证据边界

- 当前82条ready/scheduled储备均通过来源、配置与snapshot核验；未完成发布attempt为0，队列paused/failed合计0。区间13条publication error均空，不代表全天无瞬时异常。
- 发布设置及数据库调度仍启用。每店铺每日1条、24小时间隔、45天evergreen重复保护、账号最小间隔2小时及08:00–11:00/21:00–23:00窗口保持原样；ready不代表可立即发布。
- 最新已读发布[run41363000006/job125017177776](https://github.com/Sailin09/Store-Promotion/actions/runs/41363000006/job/125017177776)于北京时间11月2日07:37:27实际返回idle、reason=outside_publish_window；该次没有新增Pin。区间13条实际发布由完整历史证明，不以workflow success或HTTP200代替。
- 调度日志仅最近20条HTTP及最近10条cron，**全区间每次请求及瞬时错误覆盖不完整，未确认**。截止后的10:00请求在新核验日志中待完成，不计成功或失败；未触发额外发布。
- 本日报未执行业务修复，保留既有修复安排；两轮补货与两次实际幂等验证完成，未解决的是14条缺口。聊天正文可见、平台通知发送和设备实际收到是不同状态，后两者仍未确认。
- 按标题搜索并读取[历史发布复核Issue #3](https://github.com/Sailin09/Store-Promotion/issues/3)：数据快照为10月23日21:35，报告于UTC17:57生成，约延迟4小时22分；首段113混入后续库存，不能当21:35库存或本日报基线。

### 数据来源与双端投递

本次通过GitHub连接器确认访问，读取最新main证据目录、两份区间batch、四份cloud-run、first-deficit-followup.json、云端说明、发布/补货/verify工作流及两轮完整实际入库日志，读取Issue #2正文和全部55条既有评论，并按标题搜索发布复核Issue。未发现本日唯一标记，使用当日单条评论，保留其他日期历史。

[本次重新执行的只读Verify：run41330649087/job125054253162](https://github.com/Sailin09/Store-Promotion/actions/runs/41330649087/job/125054253162)。daily_history查询无LIMIT，从北京时间11月1日00:00起返回全部18条历史，覆盖完整区间，按真实时间筛出13条，逐条关联商品与唯一店铺且无重复Pin；完整日志278052字符。全部当前库存、储备及账号状态来自此新核验。

[完整日报存档](https://github.com/Sailin09/Store-Promotion/blob/main/operations/replenishment/daily-report-2026-11-02.md) · [配套证据](https://github.com/Sailin09/Store-Promotion/blob/main/operations/replenishment/daily-report-2026-11-02.json)。同一完整正文用于本聊天最终响应与Issue #2当日唯一评论；评论及存档读回结果另存配套证据与日报状态。聊天独立读回、平台通知及设备实际收到保持未确认。本日报未要求API key，未使用用户电脑、本地路径或heartbeat。