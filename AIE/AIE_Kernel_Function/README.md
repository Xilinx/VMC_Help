# AIE Kernel

This block allows you to import an AI Engine kernel.  
![](./Images/block.png)  

## Library

AI Engine/User-Defined Functions

## Description

The AIE Kernel block allows you to import an AI Engine kernel which is a
C/C++ program. This block supports importing Window, Stream, Cascade,
and Run time parameter as arguments to kernel function. This block also
allows you to import a function template with typename template
parameter T, and a non-type (integral) template parameter N.

## Parameters

<table id="gjy1603103179060__table_q1j_bbq_jnb" class="table"
style="width:100%;" data-cellpadding="4" data-cellspacing="0"
data-summary="" data-frame="border" data-border="1" data-rules="all">
<colgroup>
<col style="width: 16%" />
<col style="width: 16%" />
<col style="width: 16%" />
<col style="width: 50%" />
</colgroup>
<thead class="thead" style="text-align:left;">
<tr class="header row">
<th id="d46814e73" class="entry cellrowborder"
style="vertical-align: top">Parameter Name</th>
<th id="d46814e76" class="entry cellrowborder"
style="vertical-align: top">Parameter Type</th>
<th id="d46814e79" class="entry cellrowborder"
style="vertical-align: top">Criticality</th>
<th id="d46814e82" class="entry cellrowborder"
style="vertical-align: top">Description</th>
</tr>
</thead>
<tbody class="tbody">
<tr class="odd row">
<td class="entry cellrowborder" style="vertical-align: top"
headers="d46814e73 ">Kernel header file</td>
<td class="entry cellrowborder" style="vertical-align: top"
headers="d46814e76 ">String</td>
<td class="entry cellrowborder" style="vertical-align: top"
headers="d46814e79 ">Mandatory</td>
<td class="entry cellrowborder" style="vertical-align: top"
headers="d46814e82 ">Name of the header file that contains the kernel
function declaration. The string could be just the file name, a relative
path to the file or an absolute path of the file. Use the browse button
to choose the file.</td>
</tr>
<tr class="even row">
<td class="entry cellrowborder" style="vertical-align: top"
headers="d46814e73 ">Kernel function</td>
<td class="entry cellrowborder" style="vertical-align: top"
headers="d46814e76 ">String</td>
<td class="entry cellrowborder" style="vertical-align: top"
headers="d46814e79 ">Mandatory</td>
<td class="entry cellrowborder" style="vertical-align: top"
headers="d46814e82 ">Name of the kernel function for which the block is
to be created. This function should be declared in the kernel header
file.</td>
</tr>
<tr class="odd row">
<td class="entry cellrowborder" style="vertical-align: top"
headers="d46814e73 ">Kernel init function</td>
<td class="entry cellrowborder" style="vertical-align: top"
headers="d46814e76 ">String</td>
<td class="entry cellrowborder" style="vertical-align: top"
headers="d46814e79 ">Optional</td>
<td class="entry cellrowborder" style="vertical-align: top"
headers="d46814e82 ">Name of the initialization function used by the
kernel function.</td>
</tr>
<tr class="even row">
<td class="entry cellrowborder" style="vertical-align: top"
headers="d46814e73 ">Kernel source file</td>
<td class="entry cellrowborder" style="vertical-align: top"
headers="d46814e76 ">String</td>
<td class="entry cellrowborder" style="vertical-align: top"
headers="d46814e79 ">Mandatory</td>
<td class="entry cellrowborder" style="vertical-align: top"
headers="d46814e82 ">Name of the source file that contains the kernel
function definition. The string could be the file name, a relative path
to the file or an absolute path of the file.</td>
</tr>
<tr class="odd row">
<td class="entry cellrowborder" style="vertical-align: top"
headers="d46814e73 ">Kernel search paths</td>
<td class="entry cellrowborder" style="vertical-align: top"
headers="d46814e76 ">Vector of Strings</td>
<td class="entry cellrowborder" style="vertical-align: top"
headers="d46814e79 ">Optional</td>
<td class="entry cellrowborder" style="vertical-align: top"
headers="d46814e82 "><p>If the kernel header file or the kernel source
file are not found using the value provided through the 'Kernel header
file' or 'Kernel source file' fields respectively, then the paths
provided through 'Kernel search paths' are used to find the files.</p>
<p>This parameter allows use of environment variables while specifying
paths for the kernel header file and the kernel source file. The
environment variable can be used in either <code
class="ph codeph">${ENV}</code> or <code class="ph codeph">$ENV</code>
format.</p></td>
</tr>
<tr class="even row">
<td class="entry cellrowborder" style="vertical-align: top"
headers="d46814e73 ">Preprocessor options</td>
<td class="entry cellrowborder" style="vertical-align: top"
headers="d46814e76 "></td>
<td class="entry cellrowborder" style="vertical-align: top"
headers="d46814e79 ">Optional</td>
<td class="entry cellrowborder" style="vertical-align: top"
headers="d46814e82 "><p>Optional preprocessor arguments for downstream
compilation with specific preprocessor options.</p>
<p>The following two preprocessor option formats are accepted and
multiple can be selected: <code class="ph codeph">-Dname</code> and
<code class="ph codeph">-Dname=definition</code> separated by a comma.
That is, the optional argument must begin with <code
class="ph codeph">-D</code> and if the option definition value is not
provided, it is assumed to be <code class="ph codeph">1</code>.</p></td>
</tr>
</tbody>
</table>

