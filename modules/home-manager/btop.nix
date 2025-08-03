{ config, pkgs, ... }:

{
  programs.btop = {
      enable = true;
      package = pkgs.btop-rocm;
      #package = pkgs.btop;
      settings = {

        color_theme = "tokyo-storm";
        theme_background = "False";
        truecolor = "True";
        force_tty = "False";
        presets = "\"cpu:1:default,proc:0:default cpu:0:default,mem:0:default,net:0:default cpu:0:block,net:0:tty\"";
        vim_keys = "True";
        rounded_corners = "True";
        graph_symbol = "\"braille\"";
        graph_symbol_cpu =  "\"braille\"";
        graph_symbol_gpu = "\"braille\"";
        graph_symbol_mem = "\"braille\"";
        graph_symbol_net = "\"braille\"";
        graph_symbol_proc = "\"braille\"";
        shown_boxes = "mem cpu proc gpu0";
        update_ms = "2100";
        proc_sorting = "\"cpu lazy\"";
        proc_reversed = "False";
        proc_tree = "True";
        proc_colors = "True";
        proc_gradient = "True";
        proc_per_core = "False";
        proc_mem_bytes = "True";
        proc_cpu_graphs = "True";
        proc_info_smaps = "False";
        proc_left = "False";
        proc_filter_kernel = "False";
        proc_aggregate = "False";
        cpu_graph_upper = "\"Auto\"";
        cpu_graph_lower = "\"Auto\"";
        show_gpu_info = "\"Auto\"";
        cpu_invert_lower = "True";
        cpu_single_graph = "False";
        cpu_bottom = "False";
        show_uptime = "True";
        check_temp = "True";
        cpu_sensor = "\"Auto\"";
        show_coretemp = "True";
        temp_scale = "\"celsius\"";
        base_10_sizes = "False";
        show_cpu_freq = "True";
        clock_format = "\"%X\"";
        background_update = "True";
        mem_graphs = "True";
        mem_below_net = "False";
        zfs_arc_cached = "True";
        show_swap = "True";
        swap_disk = "True";
        show_disks = "True";
        only_physical = "True";
        use_fstab = "True";
        zfs_hide_datasets = "False";
        disk_free_priv = "False";
        show_io_stat = "True";
        io_mode = "True";
        io_graph_combined = "False";
        net_download = "100";
        net_upload = "100";
        net_auto = "False";
        net_sync = "True";
        base_10_bitrate = "\"Auto\"";
        show_battery = "True";
        selected_battery = "\"Auto\"";
        show_battery_watts = "True";
        log_level = "\"WARNING\"";
        nvml_measure_pcie_speeds = "True";
        rsmi_measure_pcie_speeds = "True";
        gpu_mirror_graph = "True";
	custom_gpu_name0 = "amdgpu";


      };
      };



}

