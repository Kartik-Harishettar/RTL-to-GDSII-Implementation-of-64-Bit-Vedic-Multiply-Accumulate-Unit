# RTL-to-GDSII Design Flow of a 64-bit Vedic MAC Unit

---

## 🔷 Introduction
A Multiply–Accumulate (MAC) unit is a fundamental arithmetic block used extensively in
Digital Signal Processing (DSP), image processing, machine learning accelerators, and
high-performance computing systems. A MAC performs multiplication followed by
accumulation in a single operation, making it critical for compute-intensive applications.

This project presents the complete **RTL-to-GDSII implementation of a 64-bit Vedic
Multiply–Accumulate (MAC) unit** using **Verilog HDL** and **Cadence EDA tools**
targeting **90nm CMOS technology**. The design leverages the **Urdhva–Tiryagbhyam**
Vedic multiplication technique to achieve high-speed and area-efficient arithmetic
operations.

---

## 🧠 MAC Architecture Overview
The 64-bit Vedic MAC architecture consists of:
- A Vedic multiplier based on Urdhva–Tiryagbhyam
- A 64-bit accumulator
- Control logic with enable and reset
- Clocked registers for sequential accumulation

![MAC Block Diagram](results/mac_block_diagram.png)
*Block diagram of the 64-bit Vedic MAC unit*

---

## 1️⃣ RTL Design
The RTL was implemented in **Verilog HDL** using a hierarchical and modular approach.
Smaller Vedic multiplier blocks are recursively combined to form the 64-bit multiplier,
ensuring scalability and ease of verification.

![RTL Schematic](results/rtl_schematic.png)
*RTL schematic of the 64-bit Vedic MAC*

---

## 2️⃣ Functional Verification
Functional verification was performed using a dedicated Verilog testbench. Simulation
waveforms confirm correct multiplication, accumulation, reset, and enable behavior
before synthesis.

![Simulation Waveform](results/simulation_waveform.png)
*Simulation results verifying MAC functionality*

---

## 3️⃣ Example: Partial Product Generation
To understand the advantage of the Vedic multiplier, consider a simple binary
multiplication example.

In a conventional binary multiplier, partial products are generated sequentially by
ANDing each bit of the multiplier with the multiplicand and shifting accordingly. Each
partial product is summed sequentially, increasing propagation delay.

![Partial Product Example](results/partial_product_example.png)
*Partial product generation in a conventional binary multiplier*

In contrast, the **Vedic multiplier (Urdhva–Tiryagbhyam)** generates partial products
in parallel using vertical and crosswise operations. These products are summed
hierarchically, significantly reducing delay and improving performance.

---

## 4️⃣ Floorplanning
Floorplanning was performed in **Cadence Innovus** by defining the core area, aspect
ratio, and standard-cell rows. The wide datapath of the 64-bit MAC was carefully
considered to reduce routing congestion and improve timing.

![Floorplan View](results/floorplan.png)
*Floorplan showing core boundary and layout organization*

---

## 5️⃣ Pin Planning (IO Planning)
IO pin planning was carried out using an automated `.io` file. Pins were uniformly
distributed along the periphery of the core to minimize routing complexity and improve
signal integrity.

![Pin Planning View](results/pin_planning.png)
*IO pin placement around the core boundary*

---

## 6️⃣ Power Planning
A robust power distribution network was implemented using horizontal and vertical
VDD/VSS rails and power stripes across multiple metal layers. This ensures stable
power delivery, minimal IR drop, and reliable operation under high switching activity.

![Power Planning View](results/power_planning.png)
*Power planning with VDD/VSS stripes across the core*

---

## 7️⃣ Standard Cell Placement
Standard cells were placed to minimize wirelength, reduce congestion, and achieve
better timing closure. Arithmetic blocks such as the multiplier and accumulator were
clustered to optimize critical paths.

![Placement View](results/placement.png)
*Standard-cell placement of the 64-bit Vedic MAC*

---

## 8️⃣ Clock Tree Synthesis (CTS)
Clock Tree Synthesis was performed to distribute the clock uniformly across all
sequential elements while minimizing clock skew and latency.

---

## 9️⃣ Routing
Global and detailed routing were completed using multiple metal layers while strictly
adhering to 90nm design rules. Routing was optimized to reduce parasitics and
congestion.

![Routed Layout](results/routed_layout.png)
*Fully routed layout of the 64-bit Vedic MAC*

---

## 🔟 Antenna Check
Antenna rule checks were performed to prevent charge accumulation on long metal
interconnects during fabrication. Any antenna violations were resolved using diode
insertion or routing optimization.

![Antenna Report](reports/antenna_report.png)
*Antenna check report after routing*

---

## 1️⃣1️⃣ Physical Verification (DRC)
Design Rule Checking (DRC) was performed to ensure that the layout satisfies all
foundry manufacturing constraints. The design completed DRC with zero violations.

![DRC Report](reports/drc_report.png)
*DRC report showing zero violations*

---

## 1️⃣2️⃣ Area Utilization
Post-layout area analysis shows that the Vedic multiplier occupies the majority of
the silicon area due to its hierarchical structure. The overall layout fits within the
defined floorplan and maintains sufficient whitespace for routing.

![Area Report](reports/area_report.png)
*Final area utilization report*

---

## 1️⃣4️⃣ Post-Layout Timing Analysis
Parasitic extraction and post-layout static timing analysis were performed. The design
achieved **positive timing slack**, confirming successful timing closure at the target
clock frequency.

![Timing Analysis](reports/timing_analysis.png)
*Post-layout timing analysis with positive slack*

---

## 1️⃣5️⃣ GDSII Generation
The final GDSII layout was generated after successful completion of routing and
physical verification, completing the RTL-to-GDSII flow.

⚠️ **Note:** GDSII files and standard-cell libraries are not included due to EDA
licensing and NDA restrictions.

---

