# RTL-to-GDSII Design Flow of a 64-bit Vedic MAC Unit

---

## 🔷 Introduction
A Multiply–Accumulate (MAC) unit is a fundamental arithmetic block used extensively in
Digital Signal Processing (DSP), image processing, machine learning accelerators, and
high-performance computing systems. A MAC performs multiplication followed by
accumulation in a single operation, making it critical for compute-intensive applications.

This project presents the complete **RTL-to-GDSII implementation of a 64-bit Vedic
Multiply–Accumulate (MAC) unit** using **Verilog HDL** and **Cadence EDA tools**
targeting **90nm CMOS technology**. The design leverages the
**Urdhva–Tiryagbhyam** Vedic multiplication technique to achieve high-speed and
area-efficient arithmetic operations.

---

## 🧠 MAC Architecture Overview
The 64-bit Vedic MAC architecture consists of:
- Vedic multiplier based on Urdhva–Tiryagbhyam  
- 64-bit accumulator  
- Control logic with enable and reset  
- Clocked registers for sequential accumulation  

<p align="center">
  <img src="results/mac_block_diagram.png" width="550">
</p>
<p align="center"><i>Block diagram of the 64-bit Vedic MAC unit</i></p>

---

## 1️⃣ RTL Design
The RTL was implemented in **Verilog HDL** using a hierarchical and modular approach.
Smaller Vedic multiplier blocks are recursively combined to form the 64-bit multiplier.

<p align="center">
  <img src="results/rtl_schematic.png" width="600">
</p>
<p align="center"><i>RTL schematic of the 64-bit Vedic MAC</i></p>

---

## 2️⃣ Functional Verification
Functional verification was performed using a dedicated Verilog testbench. Simulation
waveforms confirm correct multiplication, accumulation, reset, and enable behavior.

<p align="center">
  <img src="results/simulation_waveform.png" width="700">
</p>
<p align="center"><i>Simulation waveform verifying MAC functionality</i></p>

---

## 3️⃣ Example: Partial Product Generation
In a conventional binary multiplier, partial products are generated sequentially,
increasing propagation delay. In contrast, the Vedic multiplier generates partial
products in parallel using vertical and crosswise operations, significantly improving
performance.

<p align="center">
  <img src="results/partial_product_example.png" width="650">
</p>
<p align="center"><i>Partial product generation comparison</i></p>

---

## 4️⃣ Floorplanning
Floorplanning was carried out in **Cadence Innovus** by defining the core area, aspect
ratio, and standard-cell rows to reduce congestion and improve timing.

<p align="center">
  <img src="results/floorplan.png" width="600">
</p>
<p align="center"><i>Floorplan showing core boundary and layout organization</i></p>

---

## 5️⃣ Pin Planning (IO Planning)
IO pins were uniformly distributed around the periphery of the core using an automated
`.io` file to improve routability and signal integrity.

<p align="center">
  <img src="results/pin_planning.png" width="600">
</p>
<p align="center"><i>IO pin placement around the core</i></p>

---

## 6️⃣ Power Planning
A robust power distribution network was implemented using VDD/VSS rails and power
stripes across multiple metal layers to ensure reliable power delivery.

<p align="center">
  <img src="results/power_planning.png" width="600">
</p>
<p align="center"><i>Power planning with VDD/VSS stripes</i></p>

---

## 7️⃣ Standard Cell Placement
Standard cells were placed to minimize wirelength, reduce congestion, and improve
timing closure. Arithmetic blocks were clustered to optimize critical paths.

<p align="center">
  <img src="results/placement.png" width="600">
</p>
<p align="center"><i>Standard-cell placement view</i></p>

---

## 9️⃣ Routing
Global and detailed routing were completed while adhering to 90nm design rules.

<p align="center">
  <img src="results/routed_layout.png" width="600">
</p>
<p align="center"><i>Fully routed layout</i></p>

---

## 🔟 Antenna Check
Antenna rule checks were performed and violations were resolved using diode insertion
and routing optimization.

<p align="center">
  <img src="reports/antenna_report.png" width="650">
</p>
<p align="center"><i>Antenna check report</i></p>

---

## 1️⃣1️⃣ Physical Verification (DRC)
The design completed Design Rule Checking (DRC) with zero violations.

<p align="center">
  <img src="reports/drc_report.png" width="650">
</p>
<p align="center"><i>DRC clean report</i></p>

---

## 1️⃣2️⃣ Area Utilization
Post-layout area analysis confirms efficient utilization of silicon area.

<p align="center">
  <img src="reports/area_report.png" width="600">
</p>
<p align="center"><i>Final area utilization</i></p>

---

## 1️⃣4️⃣ Post-Layout Timing Analysis
Post-layout STA confirms **positive timing slack**, indicating successful timing closure.

<p align="center">
  <img src="reports/timing_analysis.png" width="650">
</p>
<p align="center"><i>Post-layout timing analysis</i></p>

---

## 1️⃣5️⃣ GDSII Generation
The final GDSII layout was generated after successful routing and physical verification.

⚠️ **Note:** GDSII and standard-cell libraries are excluded due to EDA licensing
and NDA restrictions.
